{
  cell,
  ...
}:
{
  imports = with cell.homeProfiles; [
    helix
    git
    vscode
    codex
  ];
}
