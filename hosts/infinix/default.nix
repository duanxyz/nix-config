{
  ...
}:
{
  imports = [
    ./hardware.nix
    ./power.nix
    ../common.nix
  ];

  networking.hostName = "infinix";
  system.stateVersion = "25.05"; # NOTE: jangan diubah
}
