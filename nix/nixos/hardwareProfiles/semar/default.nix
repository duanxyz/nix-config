{
  inputs,
  cell,
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    cell.diskoConfigurations.semar
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
    "rtsx_usb_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod;

  zramSwap = {
    enable = true;
    memoryPercent = 75;
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 90;
  };

  hardware.firmware = [ pkgs.linux-firmware ];
  hardware.intelgpu.driver = "xe";

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
