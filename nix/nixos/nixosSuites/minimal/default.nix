{
  cell,
  ...
}:
{
  imports = with cell.nixosModules; [
    base
  ];
}
