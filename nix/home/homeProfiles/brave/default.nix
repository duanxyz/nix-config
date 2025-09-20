{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  home.packages = [ pkgs.brave ];
}
