{
  inputs,
  cell,
}:
{
  home.packages = with pkgs; [
    fish
    git
    brave
    kitty
  ];
}
