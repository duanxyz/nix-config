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
    cell.users.duan
    cell.users.root
    cell.nixosProfiles.common
    cell.nixosProfiles.gnome
  ];

  networking.hostName = "semar"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command flakes" ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}
