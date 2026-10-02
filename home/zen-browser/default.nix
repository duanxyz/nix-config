{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  zen = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight;
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    ./bookmarks.nix
    ./containers.nix
    ./policies.nix
    ./settings.nix
    ./workspaces.nix
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles."default" = {
      id = 0;
      isDefault = true;
    };
  };

  xdg.mimeApps =
    let
      value = zen.meta.desktopFileName;
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
    lib.mkIf config.programs.zen-browser.enable {
      associations.added = associations;
      defaultApplications = associations;
    };
}