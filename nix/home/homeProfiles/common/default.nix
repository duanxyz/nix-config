{
  inputs,
  cell,
}:
{
  home.packages = with pkgs; [
    brightnessctl
    xdg-utils
    brave
    kitty
    fd
  ];
}
