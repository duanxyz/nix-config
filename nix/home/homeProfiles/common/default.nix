{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
let
  fontsLib = import (inputs.self + "/lib/fonts.nix");
in
{
  home.packages = with pkgs; [
    brightnessctl
    fd
    just
    unzip
    unrar
    xdg-utils
  ];

  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.twilight;
        in
        zen-browser.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map
          (name: {
            inherit name value;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "application/xhtml+xml"
            "application/json"
            "text/plain"
            "text/html"
          ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = fontsLib.monospaceFamilies;
  };
}
