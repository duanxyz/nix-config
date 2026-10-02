{
  description = "duan's NixOS + Home Manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ai-tools = {
      url = "github:numtide/nix-ai-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      system = "x86_64-linux";
      hosts = [
        "t14g2amd"
        "infinix"
      ];

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.nix-vscode-extensions.overlays.default ];
      };

      treefmt = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      # NOTE: nama attr = networking.hostName, jadi `nh os switch` auto-detect
      nixosConfigurations = lib.genAttrs hosts (
        host:
        lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/${host} ];
        }
      );

      # NOTE: format user@host, jadi `nh home switch` auto-detect
      homeConfigurations = lib.listToAttrs (
        map (
          host:
          lib.nameValuePair "duan@${host}" (
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = { inherit inputs host; };
              modules = [ ./home ];
            }
          )
        ) hosts
      );

      formatter.${system} = treefmt.config.build.wrapper;

      checks.${system} = {
        formatting = treefmt.config.build.check self;
      }
      // lib.mapAttrs' (
        n: c: lib.nameValuePair "nixos-${n}" c.config.system.build.toplevel
      ) self.nixosConfigurations
      // lib.mapAttrs' (n: c: lib.nameValuePair "home-${n}" c.activationPackage) self.homeConfigurations;

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          nh
          nvd
          nix-output-monitor
          nix-tree
          inputs.agenix.packages.${system}.default
        ];
      };
    };

  # NOTE: tetap di sini supaya `nix develop`/CI pertama bisa pakai cache.
  # Untuk sistem yang sudah jalan, substituter yang sebenarnya diatur di nixos/nix.nix (§9).
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://numtide.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    ];
  };
}
