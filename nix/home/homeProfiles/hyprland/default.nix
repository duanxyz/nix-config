{
  inputs,
  cell,
  pkgs,
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = false;
    settings = lib.mkMerge (
      builtins.attrValues (
        inputs.haumea.lib.load {
          src = ./_config;
          loader = inputs.haumea.lib.loaders.scoped;
        }
      )
    );
  };

  xdg.configFile."uwsm/env".source = ./_uwsm/env;
  xdg.configFile."uwsm/env-hyprland".source = ./_uwsm/env-hyprland;
}
