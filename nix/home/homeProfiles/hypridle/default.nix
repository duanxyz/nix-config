{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
let
  hyprlock = "pidof hyprlock || hyprlock --immediate";
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = hyprlock;
        before_sleep_cmd = hyprlock;
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = hyprlock;
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
