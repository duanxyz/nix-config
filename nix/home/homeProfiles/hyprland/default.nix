{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  haumeaLib = import (inputs.self + "/lib/haumea.nix") { inherit inputs; };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = false;
    # NOTE: Default changed to "lua"; keep hyprlang since our settings are in that format.
    configType = "hyprlang";
    settings = lib.mkMerge (haumeaLib.scopedValues { src = ./_config; });
    extraConfig = ''
      # extra config
      source = ~/.config/hypr/extra.conf
    '';
  };

  xdg.configFile."hypr/extra.conf".text = "";

  xdg.configFile."uwsm/env".source = ./_uwsm/env;
  xdg.configFile."uwsm/env-hyprland".source = ./_uwsm/env-hyprland;

  services.hyprpolkitagent.enable = true;
}
