{
  inputs,
  cell,
}:
let
  inherit (inputs.std.lib.dev) mkShell;
  inherit (inputs.nixpkgs.lib) mapAttrs;

  mkBee = (import (inputs.self + "/lib/mkBee.nix")) { inherit inputs; };
  bee = mkBee {
    overlays = [
      inputs.agenix.overlays.default
    ];
  };

  inherit (bee) pkgs;
in
mapAttrs (_: mkShell) {
  default = {
    name = "nix-config";

    imports = [ inputs.std.std.devshellProfiles.default ];

    packages = with pkgs; [
      gitFull
      nix-tree
    ];

    commands = [
      {
        package = pkgs.agenix;
        category = "secrets";
      }
    ];
  };
}
