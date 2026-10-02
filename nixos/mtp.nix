{ pkgs, ... }:
{
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    # NOTE: jmtpfs dan simple-mtpfs dihapus dari nixpkgs (unmaintained).
    # aft = android-file-transfer, CLI adb-like: `aft push <src> <dst>`.
    android-file-transfer
    libmtp
  ];

  programs.fuse.userAllowOther = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ENV{ID_MTP_DEVICE}=="1", GROUP="users", MODE="0660"
  '';

  users.groups.plugdev = { };

  users.users.duan.extraGroups = [ "plugdev" ];
}
