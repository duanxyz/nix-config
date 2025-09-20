{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
        linemode = "size";
        show_symlink = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
        cache_dir = "";
        image_quality = 75;
      };
      opener = {
        edit = [
          {
            run = ''hx "$@"'';
            block = true;
          }
        ];
        open = [
          {
            run = ''xdg-open "$@"'';
            orphan = true;
          }
        ];
      };
      open = {
        rules = [
          {
            name = "*.{txt,md}";
            use = "edit";
          }
          {
            name = "*.{jpg,png,gif}";
            use = "open";
          }
        ];
      };
    };
  };
}
