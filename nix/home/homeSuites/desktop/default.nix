{
  cell,
  ...
}:
{
  imports = with cell.homeModules; [
    hypr
    guiApps
  ];
}
