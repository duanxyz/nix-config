{
  inputs,
  cell,
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
  };
}
