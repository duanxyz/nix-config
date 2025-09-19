{
  inputs,
  cell,
}:
{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.default;

    settings = {
      bar = {
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "cputemp"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "volume"
              "network"
              "battery"
              "systray"
              "clock"
              "notifications"
            ];
          };
        };
        network.label = false;
        volume.label = true;
        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };
        launcher.autoDetectIcon = true;
        workspaces = {
          workspaceMask = false;
          show_numbered = true;
          ignored = "-98";
          numbered_active_indicator = "highlight";
        };
        battery.hideLabelWhenFull = false;
        clock.showIcon = false;
      };
      menus = {
        dashboard = {
          directories.enabled = false;
          shortcuts.left.shortcut1.icon = "";
          shortcuts.left.shortcut1.command = "uwsm-app -- zen-twilight";
          shortcuts.left.shortcut1.tooltip = "Zen Browser";
          shortcuts.left.shortcut2.icon = "";
          shortcuts.left.shortcut2.command = "";
          shortcuts.left.shortcut2.tooltip = "";
          shortcuts.left.shortcut3.icon = "";
          shortcuts.left.shortcut3.command = "";
          shortcuts.left.shortcut3.tooltip = "";
          shortcuts.left.shortcut4.tooltip = "Search Apps";
          shortcuts.left.shortcut4.command = "rofi -show drun";
          shortcuts.left.shortcut4.icon = "";
          powermenu.avatar.image = inputs.self + "/assets/face-icon.jpg";
        };
        power.lowBatteryNotification = true;
        clock.weather.location = "martapura";
        clock.weather.unit = "metric";
      };

      theme = {
        bar = {
          transparent = true;
          floating = true;
        };
        font = {
          name = "CommitMono Nerd Font";
          label = "CommitMono Nerd Font";
        };
      };
    };
  };

  home.packages = with pkgs; [
    libgtop
    dart-sass
    wl-clipboard
    gvfs
    gtksourceview
    libsoup_3
    grimblast
    wf-recorder
  ];
}
