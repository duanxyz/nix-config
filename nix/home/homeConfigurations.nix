{
  inputs,
  cell,
}:
let
  bee = rec {
    system = "x86_64-linux";
    home = inputs.home-manager;
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.nix-vscode-extensions.overlays.default
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
    imports =
      (with cell.homeSuites; [
        common
      ])
      ++ (with cell.homeProfiles; [
        common
        hyprland
        hyprpaper
        helix
        ssh
        git
        hyprlock
        hypridle
        bat
        eza
        ripgrep
        skim
        zoxide
        yazi
        zen-browser
        kitty
        vscode
        zellij
        hyprpanel
        codex
      ]);
  };
}
