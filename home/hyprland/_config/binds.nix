{ lib, ... }:
let
  mkInline = lib.generators.mkLuaInline;
in
{
  config = {
    binds = {
      workspace_back_and_forth = true;
    };
  };

  mod = {
    _var = "SUPER";
  };

  bind = [
    {
      _args = [
        (mkInline ''mod .. " + Return"'')
        (mkInline ''hl.dsp.exec_cmd("uwsm-app -- kitty")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + B"'')
        (mkInline ''hl.dsp.exec_cmd("uwsm-app -- zen-twilight")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + C"'')
        (mkInline ''hl.dsp.exec_cmd("uwsm-app -- windsurf")'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + Q"'')
        (mkInline "hl.dsp.window.close()")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + F"'')
        (mkInline ''hl.dsp.window.fullscreen({ mode = "maximized" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + Space"'')
        (mkInline "hl.dsp.window.float()")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + S"'')
        (mkInline ''hl.dsp.layout("togglesplit")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + F"'')
        (mkInline ''hl.dsp.window.float({ action = "disable" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + R"'')
        (mkInline ''hl.dsp.exec_cmd("hyprctl reload")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + R"'')
        (mkInline ''hl.dsp.exec_cmd("hyprctl --batch \"animations:enabled false ; keyword decoration:blur:enabled false\"")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + grave"'')
        (mkInline ''hl.dsp.workspace.toggle_special("term")'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + grave"'')
        (mkInline ''hl.dsp.window.move({ workspace = "special:term" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + left"'')
        (mkInline ''hl.dsp.focus({ direction = "l" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + right"'')
        (mkInline ''hl.dsp.focus({ direction = "r" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + up"'')
        (mkInline ''hl.dsp.focus({ direction = "u" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + down"'')
        (mkInline ''hl.dsp.focus({ direction = "d" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + H"'')
        (mkInline ''hl.dsp.focus({ direction = "l" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + L"'')
        (mkInline ''hl.dsp.focus({ direction = "r" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + K"'')
        (mkInline ''hl.dsp.focus({ direction = "u" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + J"'')
        (mkInline ''hl.dsp.focus({ direction = "d" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + 1"'')
        (mkInline "hl.dsp.focus({ workspace = 1 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + 2"'')
        (mkInline "hl.dsp.focus({ workspace = 2 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + 3"'')
        (mkInline "hl.dsp.focus({ workspace = 3 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + period"'')
        (mkInline ''hl.dsp.focus({ workspace = "+1" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + comma"'')
        (mkInline ''hl.dsp.focus({ workspace = "-1" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + SHIFT + 1"'')
        (mkInline "hl.dsp.window.move({ workspace = 1 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + 2"'')
        (mkInline "hl.dsp.window.move({ workspace = 2 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + 3"'')
        (mkInline "hl.dsp.window.move({ workspace = 3 })")
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + left"'')
        (mkInline ''hl.dsp.window.move({ workspace = "l" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + right"'')
        (mkInline ''hl.dsp.window.move({ workspace = "r" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + CTRL + left"'')
        (mkInline ''hl.dsp.window.move({ direction = "l" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + CTRL + right"'')
        (mkInline ''hl.dsp.window.move({ direction = "r" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + CTRL + up"'')
        (mkInline ''hl.dsp.window.move({ direction = "u" })'')
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + CTRL + down"'')
        (mkInline ''hl.dsp.window.move({ direction = "d" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + Tab"'')
        (mkInline ''hl.dsp.focus({ workspace = "previous" })'')
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + ALT + H"'')
        (mkInline "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + L"'')
        (mkInline "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + K"'')
        (mkInline "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + J"'')
        (mkInline "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + left"'')
        (mkInline "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + right"'')
        (mkInline "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + up"'')
        (mkInline "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + ALT + down"'')
        (mkInline "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
        { repeating = true; }
      ];
    }

    {
      _args = [
        (mkInline ''mod .. " + SHIFT + H"'')
        (mkInline "hl.dsp.window.resize({ x = 640, y = 480 })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + L"'')
        (mkInline "hl.dsp.window.resize({ x = 854, y = 480 })")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mkInline ''mod .. " + SHIFT + K"'')
        (mkInline "hl.dsp.window.resize({ x = 960, y = 540 })")
        { repeating = true; }
      ];
    }

    {
      _args = [
        "XF86MonBrightnessUp"
        (mkInline ''hl.dsp.exec_cmd("brightnessctl set +2%")'')
        {
          locked = true;
          repeating = true;
        }
      ];
    }
    {
      _args = [
        "XF86MonBrightnessDown"
        (mkInline ''hl.dsp.exec_cmd("brightnessctl set 2%-")'')
        {
          locked = true;
          repeating = true;
        }
      ];
    }
    {
      _args = [
        "XF86AudioRaiseVolume"
        (mkInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'')
        {
          locked = true;
          repeating = true;
        }
      ];
    }
    {
      _args = [
        "XF86AudioLowerVolume"
        (mkInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
        {
          locked = true;
          repeating = true;
        }
      ];
    }

    {
      _args = [
        "XF86AudioMute"
        (mkInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
        { locked = true; }
      ];
    }
    {
      _args = [
        "XF86AudioMicMute"
        (mkInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
        { locked = true; }
      ];
    }
  ];
}
