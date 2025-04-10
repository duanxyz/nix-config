{
  inputs,
  cell,
}:
{
  home.packages = with pkgs; [
    brightnessctl
    fish
    git
    brave
    kitty
  ];
}
