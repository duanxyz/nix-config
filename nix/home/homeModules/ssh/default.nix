{
  cell,
  ...
}:
{
  imports = with cell.homeProfiles; [
    ssh
  ];
}
