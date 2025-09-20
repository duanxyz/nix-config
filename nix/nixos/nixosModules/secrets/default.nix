{
  cell,
  ...
}:
{
  imports = with cell.nixosProfiles; [
    agenix
  ];
}
