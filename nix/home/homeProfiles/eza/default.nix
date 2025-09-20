{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
