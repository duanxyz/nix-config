{
  ...
}:
{
  imports = [
    ./hardware.nix
    ./power.nix
    ../common.nix

    ../../nixos/bluetooth.nix
    ../../nixos/fingerprint.nix
    ../../nixos/nix-ld.nix
  ];

  networking.hostName = "t14g2amd";
  system.stateVersion = "25.11"; # NOTE: jangan diubah
}
