{
  cell,
  ...
}:
{
  imports = with cell.homeProfiles; [
    fish
    direnv
    starship
  ];
}
