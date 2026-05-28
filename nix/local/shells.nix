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

  hostRegistry = import (inputs.self + "/lib/hosts.nix");
  inherit (hostRegistry) hosts;
  defaultHost = hosts.${hostRegistry.default};

  inherit (inputs.std.lib.dev) mkShell;
  inherit (inputs.nixpkgs.lib) concatLists mapAttrs mapAttrsToList;
  inherit (bee) pkgs;

  hostCommands = hostName: host: [
    {
      name = "switch-system-${hostName}";
      category = "system";
      help = "Build and switch to the ${host.nixos} system configuration";
      command = "nh os switch . -H ${host.nixos} -- -L";
    }
    {
      name = "test-system-${hostName}";
      category = "system";
      help = "Build and activate ${host.nixos} for testing (no boot entry)";
      command = "nh os test . -H ${host.nixos} -- -L";
    }
    {
      name = "boot-system-${hostName}";
      category = "system";
      help = "Build ${host.nixos} and set it as the boot entry (no switch)";
      command = "nh os boot . -H ${host.nixos} -- -L";
    }
    {
      name = "build-system-${hostName}";
      category = "system";
      help = "Build only (dry) the ${host.nixos} system configuration";
      command = "nh os build . -H ${host.nixos} -- -L";
    }
    {
      name = "switch-home-${hostName}";
      category = "home";
      help = "Build and switch the ${host.home} Home Manager configuration";
      command = "nh home switch . -c ${host.home} -- -L";
    }
    {
      name = "build-home-${hostName}";
      category = "home";
      help = "Build only (dry) the ${host.home} Home Manager configuration";
      command = "nh home build . -c ${host.home} -- -L";
    }
  ];

  defaultHostCommands = [
    {
      name = "switch-system";
      category = "system";
      help = "Build and switch to the default ${defaultHost.nixos} system configuration";
      command = "nh os switch . -H ${defaultHost.nixos} -- -L";
    }
    {
      name = "build-system";
      category = "system";
      help = "Build only (dry) the default ${defaultHost.nixos} system configuration";
      command = "nh os build . -H ${defaultHost.nixos} -- -L";
    }
    {
      name = "switch-home";
      category = "home";
      help = "Build and switch the default ${defaultHost.home} Home Manager configuration";
      command = "nh home switch . -c ${defaultHost.home} -- -L";
    }
    {
      name = "build-home";
      category = "home";
      help = "Build only (dry) the default ${defaultHost.home} Home Manager configuration";
      command = "nh home build . -c ${defaultHost.home} -- -L";
    }
  ];
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
    ]
    ++ defaultHostCommands
    ++ concatLists (mapAttrsToList hostCommands hosts)
    ++ [
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
        help = "Format -> flake check -> build default home -> build default system";
        command = ''
          nix fmt && \
          nix flake check -L && \
          nh home build . -c ${defaultHost.home} -- -L && \
          nh os build   . -H ${defaultHost.nixos} -- -L
        '';
      }
    ];
  };
}
