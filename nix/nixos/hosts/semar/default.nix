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
    cell.nixosProfiles.hyprland
    cell.nixosProfiles.regreet
    cell.nixosProfiles.agenix
    cell.nixosProfiles.pipewire
  ];

  networking.hostName = "semar"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nix = {
    settings = {
      experimental-features = [ "nix-command flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  nix.channel.enable = false;

  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  environment.etc."nix/inputs/nixpkgs".source = inputs.nixpkgs;
  environment.etc."nix/inputs/home-manager".source = inputs.home-manager;

  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs:home-manager=/etc/nix/inputs/home-manager";

  environment.sessionVariables = {
    # NIX_PATH = lib.mkForce "nixpkgs=${inputs.nixpkgs.outPath}:home-manager=${inputs.home-manager.outPath}";
    NIX_PATH = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs:home-manager=/etc/nix/inputs/home-manager";
  };

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}
