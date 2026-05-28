{
  inputs,
  cell,
  pkgs,
  ...
}:
let
  inherit (inputs) bee;
in
{
  inherit bee;
  imports = [
    cell.hardwareProfiles.t14g2amd
    cell.users.duan
    cell.users.root
  ]
  ++ (with cell.nixosSuites; [
    workstation
  ]);
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "t14g2amd";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}
