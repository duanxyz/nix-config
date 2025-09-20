{
  cell,
  ...
}:
{
  imports =
    (with cell.homeModules; [
      commonShell
      ssh
    ])
    ++ (with cell.homeProfiles; [
      common
    ]);
}
