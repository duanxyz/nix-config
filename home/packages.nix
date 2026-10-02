{
  pkgs,
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
    nix-output-monitor
  ];
}
