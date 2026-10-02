{
  pkgs,
  ...
}:
{
  services.wayle = {
    enable = true;
    settings = {
      bar = {
        layout = [
          {
            center = [
              "custom-cpu-temp"
              "media"
              "weather"
            ];
            left = [
              "dashboard"
              "hyprland-workspaces"
              "window-title"
            ];
            monitor = "*";
            right = [
              "bluetooth"
              "network"
              "volume"
              "battery"
              "clock"
              "notifications"
            ];
            show = true;
          }
        ];
      };
      modules = {
        battery = {
          thresholds = [
            {
              above = 79;
              icon-bg-color = "green";
              label-color = "green";
            }
            {
              below = 40;
              icon-bg-color = "status-warning";
              label-color = "status-warning";
            }
            {
              below = 20;
              icon-bg-color = "status-error";
              label-color = "status-error";
            }
          ];
        };
        custom = [
          {
            border-color = "auto";
            border-show = false;
            button-bg-color = "bg-surface-elevated";
            command = "sensors | awk '/^Tctl:/ {sub(/\\+/,\"\",$2); print $2}'";
            format = "{{ output }}";
            hide-if-empty = false;
            icon-bg-color = "auto";
            icon-color = "auto";
            icon-name = "ld-thermometer-symbolic";
            icon-show = true;
            id = "cpu-temp";
            interval-ms = 5000;
            label-color = "auto";
            label-max-length = 0;
            label-show = true;
            left-click = "";
            middle-click = "";
            mode = "poll";
            restart-interval-ms = 1000;
            restart-policy = "never";
            right-click = "";
            scroll-down = "";
            scroll-up = "";
          }
        ];
        weather = {
          location = "martapura";
        };
      };
      styling = {
        palette = {
          bg = "#11111b";
          blue = "#74c7ec";
          elevated = "#1e1e2e";
          fg = "#cdd6f4";
          fg-muted = "#bac2de";
          green = "#a6e3a1";
          primary = "#b4befe";
          red = "#f38ba8";
          surface = "#181825";
          yellow = "#f9e2af";
        };
      };
    };
  };

  home.packages = with pkgs; [
    lm_sensors
  ];
}
