{
  inputs,
  cell,
}:
{
  home.packages = with pkgs; [
    brightnessctl
    xdg-utils
    fish
    brave
    kitty
    fd
  ];
}
