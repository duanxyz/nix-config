{
  pkgs,
  inputs,
  ...
}:
let
  fontsLib = import (inputs.self + "/lib/fonts.nix");
in
{
  home.packages =
    (with pkgs; [
      brightnessctl
      fd
      just
      unzip
      unrar
      xdg-utils
      nix-output-monitor
    ])
    ++ fontsLib.packages pkgs;

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = fontsLib.monospaceFamilies;
  };
}
