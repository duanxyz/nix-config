{
  inputs,
  cell,
  ...
}:
let
  inherit (inputs) bee;
in
{
  inherit bee;
  imports = [
    cell.hardwareProfiles.t14g2amd
    cell.users.duan
    cell.users.root
  ]
  ++ (with cell.nixosSuites; [
    workstation
  ])
  ++ (with cell.nixosProfiles; [
    balancedLaptop
  ]);

  networking.hostName = "t14g2amd";

  time.timeZone = "Asia/Makassar";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";
}
