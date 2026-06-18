_: {
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      auto_sync = false;
      search_mode = "fuzzy";
      style = "compact";
    };
  };
}
