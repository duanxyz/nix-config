{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../nixos/agenix.nix
    ../nixos/cli.nix
    ../nixos/fonts.nix
    ../nixos/greetd.nix
    ../nixos/hyprland.nix
    ../nixos/logging.nix
    ../nixos/mtp.nix
    ../nixos/nix.nix
    ../nixos/pipewire.nix
    ../nixos/security.nix
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Makassar";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.networkmanager.enable = true;
  services.upower.enable = true;

  users.users.duan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.nushell;
    ignoreShellProgramCheck = true;
    hashedPasswordFile = config.age.secrets.duan.path;
    linger = true;
  };
  users.users.root.hashedPasswordFile = config.age.secrets.root.path;

  programs.nh = {
    enable = true;
    flake = "/home/duan/nix-config";
    # NOTE: nh.clean belum diaktifkan. Profile HM aman dari nix.gc karena
    # HM mendaftarkan generasinya sebagai indirect GC root; yang perlu
    # dibersihkan berkala adalah link generasi lama di ~/.local/state/nix/profiles.
  };
}
