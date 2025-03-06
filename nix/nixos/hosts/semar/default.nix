{
  inputs,
  cell,
}:
let
  inherit (inputs) bee;
  inherit (bee) pkgs;
in
{
  inherit bee;
  imports = [
    cell.hardwareProfiles.semar
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "semar"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  users.users.duan = {
    password = "nixos";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      fish
      git
    ];
  };
  users.users.root.password = "nixos";

  environment.systemPackages = with pkgs; [
    wget2
    helix
    nixd
    nixfmt-rfc-style
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command flakes" ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}
