{
  inputs,
  cell,
}:
{
  home.packages = with pkgs; [
    brightnessctl
    xdg-utils
    fish
    git
    brave
    kitty
  ];
}
