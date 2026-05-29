{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  modulesPath,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    cell.diskoConfigurations.t14g2amd
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2
    # NOTE: Keep installer-detected modules; removing this made ath11k Wi-Fi unavailable.
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

  systemd.services.reload-ath11k-after-suspend = {
    description = "Reload ath11k_pci after suspend";
    after = [ "suspend.target" ];
    wantedBy = [ "suspend.target" ];

    serviceConfig.Type = "oneshot";

    script = ''
      # NOTE: ath11k_pci can fail to reconnect after suspend on this ThinkPad.
      ${pkgs.kmod}/bin/modprobe -r ath11k_pci || true
      ${pkgs.kmod}/bin/modprobe ath11k_pci
    '';
  };

  hardware.firmware = [ pkgs.linux-firmware ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
