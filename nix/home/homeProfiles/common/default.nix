{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
let
  fontsLib = import (inputs.self + "/lib/fonts.nix");
in
{
  home.packages = with pkgs; [
    brightnessctl
    fd
    just
    unzip
    unrar
    xdg-utils
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = fontsLib.monospaceFamilies;
  };
}
