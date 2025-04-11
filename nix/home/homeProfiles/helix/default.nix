{
  inputs,
  cell,
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        lsp = {
          display-inlay-hints = true;
        };
        indent-guides = {
          render = true;
          character = "┊";
          skip-levels = 1;
        };
        gutters = {
          layout = [
            "diagnostics"
            "line-numbers"
            "spacer"
            "diff"
          ];
        };
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "file-modification-indicator"
          ];
          center = [ "diagnostics" ];
          right = [
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        whitespace.render = "all";
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⏎";
        };
      };

      keys = {
        normal = {
          # File operations
          # "C-s" = ":w";
          "C-q" = ":q";
        };

        insert = {
          # Allow some common shortcuts in insert mode
          "C-left" = "move_prev_word_start";
          "C-right" = "move_next_word_end";
        };
      };
    };
  };
}
