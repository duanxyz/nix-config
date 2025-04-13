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
  };
}
