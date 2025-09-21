{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  imports = with cell.nixosProfiles; [
    cli
    security
    logging
    fonts
    nix-config
  ];

  services.upower.enable = true;
}
