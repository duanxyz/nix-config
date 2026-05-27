{
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    cell.diskoConfigurations.t14g2amd
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

  swapDevices = [ ];

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
  };

  services.fstrim.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
