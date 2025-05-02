let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHrizuun01yw/y8Rh6D5obIBhDrNvcCJI63gBdX6Vvr+ duan@semar";

  system1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhPW9rORvLaWgrdOSnAxhTbTvJaaQV5I0SJA31hXPDJ root@semar";
in
{
  "root.age".publicKeys = [
    user1
    system1
  ];
  "duan.age".publicKeys = [
    user1
    system1
  ];
}
