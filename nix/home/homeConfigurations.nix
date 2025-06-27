{
  inputs,
  cell,
}:
let
  bee = {
    system = "x86_64-linux";
    home = inputs.home-manager;
    pkgs = import inputs.nixpkgs {
      inherit (inputs.nixpkgs) system;
      config.allowUnfree = true;
      overlays = [
        inputs.nix-vscode-extensions.overlays.default
        (final: prev: {
          windsurf = prev.windsurf.overrideAttrs (oldAttrs: rec {
            version = "1.10.5";
            src = prev.fetchurl {
              url = "https://windsurf-stable.codeiumdata.com/linux-x64/stable/ff497a1ec3dde399fde9c001a3e69a58f2739dac/Windsurf-linux-x64-1.10.5.tar.gz";
              sha256 = "4639e428f23cd9e3cfefcd9730518e136cd6d1bb9faac23d7f4c0d4c53ff88ff";
            };
          });
        })
      ];
    };
  };

  home = rec {
    username = "duan";
    homeDirectory = "/home/duan";
    stateVersion = "25.05";
  };
in
{
  semar = {
    inherit bee home;
    programs.home-manager.enable = true;
    imports = with cell.homeProfiles; [
      common
      hyprland
      hyprpaper
      helix
      ssh
      git
      hyprlock
      hypridle
      fish
      bat
      direnv
      eza
      ripgrep
      skim
      zoxide
      starship
      yazi
      zen-browser
      kitty
      vscode
      zellij
    ];
  };
}
