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
    configType = "lua";
    settings = lib.mkMerge (
      haumeaLib.scopedValues {
        src = ./_config;
        extraInputs = { inherit lib; };
      }
    );
  };

  xdg.configFile."uwsm/env".source = ./_uwsm/env;
  xdg.configFile."uwsm/env-hyprland".source = ./_uwsm/env-hyprland;

  services.hyprpolkitagent.enable = true;
}
