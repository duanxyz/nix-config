{
  cell,
  ...
}:
{
  imports = with cell.nixosModules; [
    base
    desktop
    secrets
  ];
}
