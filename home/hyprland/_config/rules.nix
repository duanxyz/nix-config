{
  window_rule = [
    {
      match = {
        class = "^(.*rave-.*|.*zen-.*)$";
      };
      workspace = 1;
    }
    {
      match = {
        class = "^(codium|VSCodium|windsurf)$";
      };
      workspace = 2;
    }
    {
      match = {
        class = "^(kitty)$";
        workspace = "s[false]";
      };
      workspace = "3";
    }
    {
      match = {
        class = "^(kitty)$";
      };
      opacity = "0.85 override";
    }

    {
      match = {
        title = "^(Picture in picture|Picture-in-Picture)$";
      };
      float = true;
    }
    {
      match = {
        title = "^(Picture in picture|Picture-in-Picture)$";
      };
      pin = true;
    }
    {
      match = {
        title = "^(Picture in picture|Picture-in-Picture)$";
      };
      size = "25% 25%";
    }
    {
      match = {
        title = "^(Picture in picture|Picture-in-Picture)$";
      };
      move = "72% 7%";
    }

    {
      match = {
        class = "^(xdg-desktop-portal-gtk)$";
      };
      float = true;
    }
    {
      match = {
        title = "^(Save As|Open File|Open Folder|)$";
      };
      float = true;
    }
  ];

  workspace_rule = [
    {
      workspace = "special:term";
      gaps_in = 0;
      gaps_out = 100;
      no_border = true;
      no_shadow = true;
      on_created_empty = "kitty";
    }
    {
      workspace = "r[2-3]";
      gaps_out = 50;
    }
  ];
}
