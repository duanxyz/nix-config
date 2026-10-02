{
  ...
}:
{
  imports = [
    ./packages.nix

    # shell
    ./nushell.nix
    ./starship.nix
    ./atuin.nix
    ./carapace.nix
    ./direnv.nix
    ./zoxide.nix

    # cli
    ./bat.nix
    ./eza.nix
    ./ripgrep.nix
    ./skim.nix
    ./yazi.nix
    ./zellij.nix
    ./ssh.nix

    # dev
    ./helix
    ./git.nix
    ./vscode
    ./codex.nix
    ./hermes-agent.nix

    # desktop
    ./hyprland
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./wayle.nix
    ./kitty.nix
    ./brave.nix
    ./zen-browser
  ];

  home = {
    username = "duan";
    homeDirectory = "/home/duan";
    stateVersion = "25.05"; # NOTE: jangan diubah
  };

  programs.home-manager.enable = true;
}