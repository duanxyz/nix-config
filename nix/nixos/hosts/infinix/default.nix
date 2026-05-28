{
  inputs,
  cell,
  ...
}:
let
  inherit (inputs) bee;
in
{
  inherit bee;
  imports = [
    cell.hardwareProfiles.infinix
    cell.users.duan
    cell.users.root
    cell.nixosProfiles.power
  ]
  ++ (with cell.nixosSuites; [
    workstation
  ]);

  networking.hostName = "infinix";
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
