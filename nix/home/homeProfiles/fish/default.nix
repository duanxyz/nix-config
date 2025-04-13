{
  inputs,
  celll,
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_gretting
      set -gx EDITOR hx
      set -gx VISUAL hx
    '';
    shellAliases = {
      cat = "bat";
      g = "git";
      gs = "git status";
      gd = "git add";
      v = "hx";
      f = "fd";
      r = "rg";
      j = "just";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
