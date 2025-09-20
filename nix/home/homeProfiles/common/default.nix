{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  home.packages = with pkgs; [
    brightnessctl
    fd
    just
    unzip
    unrar
    xdg-utils
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [
      "CommitMono Nerd Font"
      "JetBrainsMono Nerd Font"
    ];
  };
}
