{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    cell.diskoConfigurations.t14g2amd
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci_renesas"
    "xhci_pci"
    "uas"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # NOTE: Keep bootloader and kernel choice with this machine-specific profile.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  swapDevices = [ ];

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
  };

  services.fstrim.enable = true;
  services.fwupd.enable = true;

  hardware.firmware = [ pkgs.linux-firmware ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
