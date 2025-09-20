{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  home.packages = with pkgs; [
    brightnessctl
    xdg-utils
    brave
    kitty
    fd
    just
    unzip
    unrar
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
    defaultFonts.monospace = [
      "CommitMono Nerd Font"
      "JetBrainsMono Nerd Font"
    ];
  };
}
