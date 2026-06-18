{
  cell,
  ...
}:
{
  imports =
    (with cell.homeModules; [
      ssh
    ])
    ++ (with cell.homeProfiles; [
      common
    ]);
}
