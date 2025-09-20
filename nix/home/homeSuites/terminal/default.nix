{
  cell,
  ...
}:
{
  imports = with cell.homeModules; [
    commonShell
    cliTools
  ];
}
