{
  cell,
  ...
}:
{
  imports = with cell.homeProfiles; [
    nushell
    direnv
    starship
    zoxide
    carapace
    atuin
    nh
  ];
}
