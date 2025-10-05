{
  pkgs,
  inputs,
  ...
}:
let
  fontsLib = import (inputs.self + "/lib/fonts.nix");
in
{
  fonts.packages = fontsLib.packages pkgs;
}
