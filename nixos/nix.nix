{
  lib,
  inputs,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    channel.enable = false;
    registry.nixpkgs.flake = inputs.nixpkgs;
  };

  environment.etc."nix/inputs/nixpkgs".source = inputs.nixpkgs;
  environment.etc."nix/inputs/home-manager".source = inputs.home-manager;

  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs:home-manager=/etc/nix/inputs/home-manager";

  environment.sessionVariables = {
    NIX_PATH = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs:home-manager=/etc/nix/inputs/home-manager";
  };
}
