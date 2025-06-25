{
  windowrulev2 = [
    # ---------------------------
    # Workspace Assignment Rules
    # ---------------------------
    # Workspace 1: Browser
    "workspace 1, class:^(.*rave-.*|.*zen-.*)$"

    # Workspace 2: IDE/Code Editor`
    "workspace 2, class:^(codium|VSCodium|windsurf)$"

    # Workspace 3: Terminal
    "workspace 3, class:^(kitty)$"
    "opacity 0.85 override, class:^(kitty)$"

    # ---------------------------
    # Productivity Enhancements
    # ---------------------------
    # Video Popouts
    "float, title:^(Picture in picture|Picture-in-Picture)$"
    "pin, title:^(Picture in picture|Picture-in-Picture)$"
    "size 25% 25%, title:^(Picture in picture|Picture-in-Picture)$"
    "move 72% 7%, title:^(Picture in picture|Picture-in-Picture)$"

    # Temporary Windows
    "float, class:^(xdg-desktop-portal-gtk)$"
    "float, title:^(Save As|Open File|Open Folder|)$"

    # ---------------------------
    # Workspace Management Rules
    # ---------------------------
    # Auto-back to Workspace 1 when browser closed
    "workspace 1 silent, class:^(.*rave-.*|.*zen-.*)$, onworkspaceclose:1"
  ];

  # Special Workspaces
  workspace = [
    "special:term, gapsin:0, gapsout:100, border:false, shadow:false, on-created-empty:kill"
    "special:term, on-created-empty:kitty"
    "r[2-3], gapsout:50"
  ];
}
