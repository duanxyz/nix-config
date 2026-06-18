{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Preview dependencies
    file
    ffmpegthumbnailer
    poppler-utils
    fd
    unar
    jq
    imagemagick
    wl-clipboard
  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    plugins = with pkgs.yaziPlugins; {
      full-border = {
        package = full-border;
        setup = true;
      };
      smart-enter = smart-enter;
      chmod = chmod;
      jump-to-char = jump-to-char;
      toggle-pane = toggle-pane;
      git = {
        package = git;
        setup = true;
      };
      smart-filter = smart-filter;
    };

    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
        linemode = "size";
        show_symlink = true;
        ratio = [ 1 3 4 ];
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
        image_quality = 75;
      };
      opener = {
        edit = [
          { run = ''hx %s''; block = true; "for" = "unix"; }
        ];
        open = [
          { run = ''xdg-open %s1''; orphan = true; "for" = "unix"; }
        ];
        reveal = [
          { run = ''xdg-open %d1''; orphan = true; "for" = "unix"; }
        ];
        play = [
          { run = ''mpv --force-window %s''; orphan = true; "for" = "unix"; }
        ];
        archive = [
          { run = ''unar %s1''; }
        ];
      };
      open = {
        rules = [
          { mime = "inode/directory"; use = [ "edit" "open" "reveal" ]; }
          { mime = "text/*"; use = [ "edit" ]; }
          { mime = "image/*"; use = [ "open" "reveal" ]; }
          { mime = "video/*"; use = [ "play" "open" "reveal" ]; }
          { mime = "audio/*"; use = [ "play" "open" "reveal" ]; }
          { mime = "inode/x-empty"; use = [ "edit" ]; }
          { mime = "application/json"; use = [ "edit" ]; }
          { mime = "application/x-bzip2"; use = [ "archive" ]; }
          { mime = "application/x-tar"; use = [ "archive" ]; }
          { mime = "application/x-7z-compressed"; use = [ "archive" ]; }
          { mime = "application/zip"; use = [ "archive" ]; }
          { mime = "application/gzip"; use = [ "archive" ]; }
          { mime = "application/x-rar"; use = [ "archive" ]; }
          { mime = "application/pdf"; use = [ "open" ]; }
          { mime = "*"; use = [ "open" ]; }
        ];
      };
    };
  };
}
