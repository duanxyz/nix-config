{
  windowrule = [
    # ---------------------------
    # Workspace Assignment Rules
    # ---------------------------
    # Workspace 1: Browser
    "workspace 1, match:class ^(.*rave-.*|.*zen-.*)$"

    # Workspace 2: IDE/Code Editor`
    "workspace 2, match:class ^(codium|VSCodium|windsurf)$"

    # Workspace 3: Terminal
    "workspace 3, match:class ^(kitty)$"
    "opacity 0.85 override, match:class ^(kitty)$"

    # ---------------------------
    # Productivity Enhancements
    # ---------------------------
    # Video Popouts
    "float on, match:title ^(Picture in picture|Picture-in-Picture)$"
    "pin on, match:title ^(Picture in picture|Picture-in-Picture)$"
    "size 25% 25%, match:title ^(Picture in picture|Picture-in-Picture)$"
    "move 72% 7%, match:title ^(Picture in picture|Picture-in-Picture)$"

    # Temporary Windows
    "float on, match:class ^(xdg-desktop-portal-gtk)$"
    "float on, match:title ^(Save As|Open File|Open Folder|)$"
  ];

  # Special Workspaces
  workspace = [
    "special:term, gapsin:0, gapsout:100, border:false, shadow:false, on-created-empty:kill"
    "special:term, on-created-empty:kitty"
    "r[2-3], gapsout:50"
  ];
}
