-- ~/.config/hypr/hyprland.lua

local hl = hyprland

--------------------------------------------------
-- MONITOR
--------------------------------------------------

hl.monitor("eDP-1,1920x1080@60,0x0,1")

--------------------------------------------------
-- GENERAL
--------------------------------------------------

hl.general({
    allow_tearing = false,
    border_size = 2,
    gaps_in = 6,
    gaps_out = 10,
    layout = "dwindle",
    resize_on_border = true,

    ["col.active_border"] =
        "rgba(33ccffee) rgba(00ff99ee) 45deg",

    ["col.inactive_border"] =
        "rgba(595959aa)",
})

--------------------------------------------------
-- DECORATION
--------------------------------------------------

hl.decoration({
    rounding = 8,

    blur = {
        enabled = true,
        brightness = 1.1,
        contrast = 1.2,
        noise = 0.01,
        passes = 3,
        size = 6,
        vibrancy = 0.5,
        xray = true,
    },

    shadow = {
        enabled = true,
        range = 15,
        render_power = 3,
        scale = 1.05,
    },
})

--------------------------------------------------
-- ANIMATIONS
--------------------------------------------------

hl.animations({
    enabled = true,
    workspace_wraparound = true,

    bezier = {
        "overshot, 0.32, 0.72, 0.38, 1.1",
        "linear, 0, 0, 1, 1",
        "wind, 0.05, 0.9, 0.1, 1.05",
        "winIn, 0.1, 1.1, 0.1, 1.1",
        "winOut, 0.3, -0.3, 0, 1",
    },

    animation = {
        "windows, 1, 4, wind, slide",
        "windowsIn, 1, 4, winIn, slide",
        "windowsOut, 1, 4, winOut, slide",
        "fade, 1, 4, overshot",
        "workspaces, 1, 4, wind, slidevert",
        "border, 1, 10, linear",
    },
})

--------------------------------------------------
-- DWINDLE
--------------------------------------------------

hl.dwindle({
    force_split = 2,
    permanent_direction_override = true,
    preserve_split = true,
    special_scale_factor = 0.95,
})

--------------------------------------------------
-- MASTER
--------------------------------------------------

hl.master({
    inherit_fullscreen = true,
    mfact = 0.6,
    orientation = "right",
})

--------------------------------------------------
-- INPUT
--------------------------------------------------

hl.input({
    accel_profile = "flat",
    follow_mouse = 1,

    kb_layout = "us",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    kb_variant = "",

    repeat_delay = 250,
    repeat_rate = 35,
    sensitivity = 0.5,

    touchpad = {
        disable_while_typing = true,
        drag_lock = true,
        natural_scroll = false,
        ["tap-to-click"] = true,
    },
})

--------------------------------------------------
-- GESTURES
--------------------------------------------------

hl.gestures({
    workspace_swipe_cancel_ratio = 0.2,
    workspace_swipe_distance = 500,
    workspace_swipe_invert = true,
    workspace_swipe_min_speed_to_force = 5,
})

--------------------------------------------------
-- MISC
--------------------------------------------------

hl.misc({
    disable_hyprland_logo = true,
    enable_swallow = true,
    force_default_wallpaper = 0,
    key_press_enables_dpms = true,
    mouse_move_enables_dpms = true,
    swallow_regex = "^(kitty)$",
    vrr = 1,
})

--------------------------------------------------
-- XWAYLAND
--------------------------------------------------

hl.xwayland({
    force_zero_scaling = true,
})

--------------------------------------------------
-- BINDS
--------------------------------------------------

hl.bind("SUPER", "RETURN", function()
    hl.exec("uwsm-app -- kitty")
end)

hl.bind("SUPER", "B", function()
    hl.exec("uwsm-app -- zen-twilight")
end)

hl.bind("SUPER", "C", function()
    hl.exec("uwsm-app -- windsurf")
end)

hl.bind("SUPER", "Q", "killactive")

hl.bind("SUPER", "F", "fullscreen", "1")

hl.bind("SUPER", "Space", "togglefloating")

hl.bind("SUPER", "S", "togglesplit")

hl.bind("SUPER_SHIFT", "F", "settiled")

hl.bind("SUPER", "R", function()
    hl.exec("hyprctl reload")
end)

hl.bind("SUPER_ALT", "R", function()
    hl.exec(
        'hyprctl --batch "animations:enabled false ; keyword decoration:blur:enabled false"'
    )
end)

hl.bind("SUPER", "GRAVE", "togglespecialworkspace", "term")

hl.bind(
    "SUPER_SHIFT",
    "GRAVE",
    "movetoworkspace",
    "special:term"
)

--------------------------------------------------
-- FOCUS
--------------------------------------------------

hl.bind("SUPER", "left", "movefocus", "l")
hl.bind("SUPER", "right", "movefocus", "r")
hl.bind("SUPER", "up", "movefocus", "u")
hl.bind("SUPER", "down", "movefocus", "d")

hl.bind("SUPER", "H", "movefocus", "l")
hl.bind("SUPER", "L", "movefocus", "r")
hl.bind("SUPER", "K", "movefocus", "u")
hl.bind("SUPER", "J", "movefocus", "d")

--------------------------------------------------
-- WORKSPACES
--------------------------------------------------

hl.bind("SUPER", "1", "workspace", "1")
hl.bind("SUPER", "2", "workspace", "2")
hl.bind("SUPER", "3", "workspace", "3")

hl.bind("SUPER", "period", "workspace", "+1")
hl.bind("SUPER", "comma", "workspace", "-1")

hl.bind("SUPER_SHIFT", "1", "movetoworkspace", "1")
hl.bind("SUPER_SHIFT", "2", "movetoworkspace", "2")
hl.bind("SUPER_SHIFT", "3", "movetoworkspace", "3")

hl.bind(
    "SUPER_SHIFT",
    "left",
    "movetoworkspace",
    "l"
)

hl.bind(
    "SUPER_SHIFT",
    "right",
    "movetoworkspace",
    "r"
)

hl.bind("SUPER", "Tab", "workspace", "previous")

--------------------------------------------------
-- MOVE WINDOW
--------------------------------------------------

hl.bind("SUPER CTRL", "left", "movewindow", "l")
hl.bind("SUPER CTRL", "right", "movewindow", "r")
hl.bind("SUPER CTRL", "up", "movewindow", "u")
hl.bind("SUPER CTRL", "down", "movewindow", "d")

--------------------------------------------------
-- RESIZE
--------------------------------------------------

hl.binde(
    "SUPER_ALT",
    "H",
    "resizeactive",
    "-50 0"
)

hl.binde(
    "SUPER_ALT",
    "L",
    "resizeactive",
    "50 0"
)

hl.binde(
    "SUPER_ALT",
    "K",
    "resizeactive",
    "0 -50"
)

hl.binde(
    "SUPER_ALT",
    "J",
    "resizeactive",
    "0 50"
)

hl.binde(
    "SUPER_ALT",
    "left",
    "resizeactive",
    "-50 0"
)

hl.binde(
    "SUPER_ALT",
    "right",
    "resizeactive",
    "50 0"
)

hl.binde(
    "SUPER_ALT",
    "up",
    "resizeactive",
    "0 -50"
)

hl.binde(
    "SUPER_ALT",
    "down",
    "resizeactive",
    "0 50"
)

hl.binde(
    "SUPER_SHIFT",
    "H",
    "resizeactive",
    "exact 640 480"
)

hl.binde(
    "SUPER_SHIFT",
    "L",
    "resizeactive",
    "exact 854 480"
)

hl.binde(
    "SUPER_SHIFT",
    "K",
    "resizeactive",
    "exact 960 540"
)

--------------------------------------------------
-- MEDIA KEYS
--------------------------------------------------

hl.bindel(
    "",
    "XF86MonBrightnessUp",
    function()
        hl.exec("brightnessctl set +2%")
    end
)

hl.bindel(
    "",
    "XF86MonBrightnessDown",
    function()
        hl.exec("brightnessctl set 2%-")
    end
)

hl.bindel(
    "",
    "XF86AudioRaiseVolume",
    function()
        hl.exec(
            "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        )
    end
)

hl.bindel(
    "",
    "XF86AudioLowerVolume",
    function()
        hl.exec(
            "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        )
    end
)

hl.bindl(
    "",
    "XF86AudioMute",
    function()
        hl.exec(
            "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        )
    end
)

hl.bindl(
    "",
    "XF86AudioMicMute",
    function()
        hl.exec(
            "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        )
    end
)

--------------------------------------------------
-- BINDS SECTION
--------------------------------------------------

hl.binds({
    workspace_back_and_forth = true,
})

--------------------------------------------------
-- WINDOW RULES
--------------------------------------------------

hl.windowrule(
    "workspace 1, class:^(.*rave-.*|.*zen-.*)$"
)

hl.windowrule(
    "workspace 2, class:^(codium|VSCodium|windsurf)$"
)

hl.windowrule(
    "workspace 3, class:^(kitty)$"
)

hl.windowrule(
    "opacity 0.85 override, class:^(kitty)$"
)

hl.windowrule(
    "float, title:^(Picture in picture|Picture-in-Picture)$"
)

hl.windowrule(
    "pin, title:^(Picture in picture|Picture-in-Picture)$"
)

hl.windowrule(
    "size 25% 25%, title:^(Picture in picture|Picture-in-Picture)$"
)

hl.windowrule(
    "move 72% 7%, title:^(Picture in picture|Picture-in-Picture)$"
)

hl.windowrule(
    "float, class:^(xdg-desktop-portal-gtk)$"
)

hl.windowrule(
    "float, title:^(Save As|Open File|Open Folder|)$"
)

hl.windowrule(
    "workspace 1 silent, class:^(.*rave-.*|.*zen-.*)$, onworkspaceclose:1"
)

--------------------------------------------------
-- WORKSPACE RULES
--------------------------------------------------

hl.workspace(
    "special:term, gapsin:0, gapsout:100, border:false, shadow:false, on-created-empty:kill"
)

hl.workspace(
    "special:term, on-created-empty:kitty"
)

hl.workspace(
    "r[2-3], gapsout:50"
)

--------------------------------------------------
-- SOURCE EXTRA CONFIG
--------------------------------------------------

hl.source("~/.config/hypr/extra.conf")
