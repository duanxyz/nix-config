{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  programs.skim = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
    ];
  };
}
