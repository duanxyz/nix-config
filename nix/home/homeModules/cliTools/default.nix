{
  cell,
  ...
}:
{
  imports = with cell.homeProfiles; [
    bat
    eza
    ripgrep
    skim
    zoxide
    zellij
    yazi
  ];
}
