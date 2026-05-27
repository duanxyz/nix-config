{
  config,
  lib,
  ...
}:
{
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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
    fsType = "btrfs";
    options = [ "subvol=@log" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1AB5-785E";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
    fsType = "btrfs";
    options = [ "subvol=@cache" ];
  };

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
