{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;

    settings = {
      remember_window_size = "no";
      enabled_layouts = "splits:split_axis=horizontal";
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";

      #Cursor config
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      disable_ligatures = "never";

      #url customization
      url_style = "curly";
    };

    keybindings = {
      # Create a new window splitting the space used by the existing one so that
      # the two windows are placed one above the other
      "f5 launch" = "--location=hsplit";

      # Create a new window splitting the space used by the existing one so that
      # the two windows are placed side by side
      "f6 launch" = "--location=vsplit";

      # Create a new window splitting the space used by the existing one so that
      # the two windows are placed side by side if the existing window is wide or
      # one above the other if the existing window is tall.
      "f4 launch" = "--location=split";

      # Rotate the current split, changing its split axis from vertical to
      # horizontal or vice versa
      "f7" = "layout_action rotate";

      # Move the active window in the indicated direction
      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";

      # Move the active window to the indicated screen edge
      "ctrl+shift+up" = "layout_action move_to_screen_edge top";
      "ctrl+shift+left" = "layout_action move_to_screen_edge left";
      "ctrl+shift+right" = "layout_action move_to_screen_edge right";
      "ctrl+shift+down" = "layout_action move_to_screen_edge bottom";

      # Switch focus to the neighboring window in the indicated direction
      "ctrl+left" = "neighboring_window left";
      "ctrl+right" = "neighboring_window right";
      "ctrl+up" = "neighboring_window up";
      "ctrl+down" = "neighboring_window down";

      # Set the bias of the split containing the currently focused window. The
      # currently focused window will take up the specified percent of its parent
      # window's size.
      "ctrl+." = "layout_action bias 80";

      # Resize Windows
      "ctrl+alt+left" = "resize_window narrower";
      "ctrl+alt+right" = "resize_window wider";
      "ctrl+alt+up" = "resize_window taller";
      "ctrl+alt+down" = "resize_window shorter 3";
      # reset all windows in the tab to default sizes
      "ctrl+alt+home" = "resize_window reset";
    };
  };
}
