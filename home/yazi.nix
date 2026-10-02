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
      inherit smart-enter;
      inherit chmod;
      inherit jump-to-char;
      inherit toggle-pane;
      git = {
        package = git;
        setup = true;
      };
      inherit smart-filter;
    };

    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
        linemode = "size";
        show_symlink = true;
        ratio = [
          1
          3
          4
        ];
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
        image_quality = 75;
      };
      opener = {
        edit = [
          {
            run = "hx %s";
            block = true;
            "for" = "unix";
          }
        ];
        open = [
          {
            run = "xdg-open %s1";
            orphan = true;
            "for" = "unix";
          }
        ];
        reveal = [
          {
            run = "xdg-open %d1";
            orphan = true;
            "for" = "unix";
          }
        ];
        play = [
          {
            run = "mpv --force-window %s";
            orphan = true;
            "for" = "unix";
          }
        ];
        archive = [
          { run = "unar %s1"; }
        ];
      };
      open = {
        rules = [
          {
            mime = "inode/directory";
            use = [
              "edit"
              "open"
              "reveal"
            ];
          }
          {
            mime = "text/*";
            use = [ "edit" ];
          }
          {
            mime = "image/*";
            use = [
              "open"
              "reveal"
            ];
          }
          {
            mime = "video/*";
            use = [
              "play"
              "open"
              "reveal"
            ];
          }
          {
            mime = "audio/*";
            use = [
              "play"
              "open"
              "reveal"
            ];
          }
          {
            mime = "inode/x-empty";
            use = [ "edit" ];
          }
          {
            mime = "application/json";
            use = [ "edit" ];
          }
          {
            mime = "application/x-bzip2";
            use = [ "archive" ];
          }
          {
            mime = "application/x-tar";
            use = [ "archive" ];
          }
          {
            mime = "application/x-7z-compressed";
            use = [ "archive" ];
          }
          {
            mime = "application/zip";
            use = [ "archive" ];
          }
          {
            mime = "application/gzip";
            use = [ "archive" ];
          }
          {
            mime = "application/x-rar";
            use = [ "archive" ];
          }
          {
            mime = "application/pdf";
            use = [ "open" ];
          }
          {
            mime = "*";
            use = [ "open" ];
          }
        ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        # Smart enter: open file or enter dir
        {
          on = [ "<Enter>" ];
          run = "plugin smart-enter";
          desc = "Enter dir or open file";
        }
        # Toggle max preview
        {
          on = [ "T" ];
          run = "plugin toggle-pane";
          desc = "Toggle max preview";
        }
        # Jump to char (like vim f)
        {
          on = [ "f" ];
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
        # Chmod
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        # Smart filter
        {
          on = [ "F" ];
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
        # Zoxide jump
        {
          on = [ "z" ];
          run = "plugin zoxide";
          desc = "Zoxide jump";
        }
        # Quick navigation
        {
          on = [
            "g"
            "h"
          ];
          run = "cd ~";
          desc = "Go home";
        }
        {
          on = [
            "g"
            "c"
          ];
          run = "cd ~/.config";
          desc = "Go config";
        }
        {
          on = [
            "g"
            "d"
          ];
          run = "cd ~/Downloads";
          desc = "Go downloads";
        }
        {
          on = [
            "g"
            "n"
          ];
          run = "cd ~/nix-config";
          desc = "Go nix-config";
        }
        # Bulk rename
        {
          on = [
            "b"
            "r"
          ];
          run = "bulk_rename";
          desc = "Bulk rename";
        }
        # Copy paths
        {
          on = [
            "y"
            "p"
          ];
          run = "copy path";
          desc = "Copy file path";
        }
        {
          on = [
            "y"
            "d"
          ];
          run = "copy dirname";
          desc = "Copy dir path";
        }
        {
          on = [
            "y"
            "n"
          ];
          run = "copy filename";
          desc = "Copy filename";
        }
        # Hidden toggle
        {
          on = [ "." ];
          run = "hidden toggle";
          desc = "Toggle hidden";
        }
      ];
    };
  };
}
