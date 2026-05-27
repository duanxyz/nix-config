{
  inputs,
  cell,
}:
let
  mkBee = (import (inputs.self + "/lib/mkBee.nix")) { inherit inputs; };
  bee = mkBee {
    overlays = [
      inputs.agenix.overlays.default
    ];
  };

  hosts = (import (inputs.self + "/lib/hosts.nix")).t14g2amd;

  inherit (inputs.std.lib.dev) mkShell;
  inherit (inputs.nixpkgs.lib) mapAttrs;
  inherit (bee) pkgs;
in
mapAttrs (_: mkShell) {
  default = {
    name = "nix-config";

    imports = [ inputs.std.std.devshellProfiles.default ];

    nixago = [ cell.configs.just ];

    packages = with pkgs; [
      gitFull
      nix-tree
      nh
      nix-output-monitor
      nvd
    ];

    commands = [
      {
        package = pkgs.agenix;
        category = "secrets";
      }
      # ===== NixOS (nh os) =====
      {
        name = "switch-system";
        category = "system";
        help = "Build and switch to the ${hosts.nixos} system configuration";
        command = "nh os switch . -H ${hosts.nixos} -- -L";
      }
      {
        name = "test-system";
        category = "system";
        help = "Build and activate ${hosts.nixos} for testing (no boot entry)";
        command = "nh os test . -H ${hosts.nixos} -- -L";
      }
      {
        name = "boot-system";
        category = "system";
        help = "Build ${hosts.nixos} and set it as the boot entry (no switch)";
        command = "nh os boot . -H ${hosts.nixos} -- -L";
      }
      {
        name = "build-system";
        category = "system";
        help = "Build only (dry) the ${hosts.nixos} system configuration";
        command = "nh os build . -H ${hosts.nixos} -- -L";
      }

      # ===== Home Manager (nh home) =====
      {
        name = "switch-home";
        category = "home";
        help = "Build and switch the ${hosts.home} Home Manager configuration";
        command = "nh home switch . -c ${hosts.home} -- -L";
      }
      {
        name = "build-home";
        category = "home";
        help = "Build only (dry) the ${hosts.home} Home Manager configuration";
        command = "nh home build . -c ${hosts.home} -- -L";
      }

      # ===== Flake utilities =====
      {
        name = "update";
        category = "flake";
        help = "Update all flake inputs";
        command = "nix flake update";
      }
      {
        name = "check";
        category = "flake";
        help = "Run nix flake check";
        command = "nix flake check";
      }
      {
        name = "show";
        category = "flake";
        help = "Show flake outputs";
        command = "nix flake show";
      }

      # ===== Maintenance =====
      {
        name = "clean";
        category = "maintenance";
        help = "Clean old generations and run garbage collection (system & user profiles)";
        command = "nh clean all";
      }

      # ===== Formatting =====
      {
        name = "fmt";
        category = "format";
        help = "Format source files using nix fmt";
        command = "nix fmt";
      }
      {
        name = "check:fmt";
        category = "format";
        help = "Check formatting only (flake checks.formatting)";
        command = "nix build -L .#checks.${pkgs.system}.formatting";
      }

      # ===== Preflight (quality gate) =====
      {
        name = "preflight";
        category = "flake";
        help = "Format → flake check → build home → build system (nh uses nom for nicer logs)";
        command = ''
          nix fmt && \
          nix flake check -L && \
          nh home build . -c ${hosts.home} -- -L && \
          nh os build   . -H ${hosts.nixos} -- -L
        '';
      }
    ];
  };
}
