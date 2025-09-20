{
  cell,
  ...
}:
{
  imports = with cell.nixosProfiles; [
    common
  ];
}
