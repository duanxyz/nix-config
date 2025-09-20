{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
