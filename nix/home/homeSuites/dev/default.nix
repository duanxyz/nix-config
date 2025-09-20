{
  cell,
  ...
}:
{
  imports = with cell.homeModules; [
    devTools
  ];
}
