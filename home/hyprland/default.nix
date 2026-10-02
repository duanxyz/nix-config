{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  # NOTE: fragment di _config/ tidak seragam — binds.nix berupa function
  # ({ lib, ... }:), sisanya attrset biasa. Dua-duanya harus didukung.
  loadFragment =
    f:
    let
      fragment = import f;
    in
    if lib.isFunction fragment then fragment { inherit lib; } else fragment;
  fragments = map loadFragment [
    ./_config/animations.nix
    ./_config/autostart.nix
    ./_config/binds.nix
    ./_config/decoration.nix
    ./_config/general.nix
    ./_config/gestures.nix
    ./_config/input.nix
    ./_config/layouts.nix
    ./_config/misc.nix
    ./_config/rules.nix
  ];
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = false;
    configType = "lua";
    settings = lib.mkMerge fragments;
  };

  xdg.configFile."uwsm/env".source = ./uwsm/env;
  xdg.configFile."uwsm/env-hyprland".source = ./uwsm/env-hyprland;

  services.hyprpolkitagent.enable = true;
}
