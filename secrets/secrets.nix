let
  user1 = {
    full = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHrizuun01yw/y8Rh6D5obIBhDrNvcCJI63gBdX6Vvr+ duan@semar";
    key = "AAAAC3NzaC1lZDI1NTE5AAAAIHrizuun01yw/y8Rh6D5obIBhDrNvcCJI63gBdX6Vvr+";
  };

  system1 = {
    full = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhPW9rORvLaWgrdOSnAxhTbTvJaaQV5I0SJA31hXPDJ root@semar";
    key = "AAAAC3NzaC1lZDI1NTE5AAAAIFhPW9rORvLaWgrdOSnAxhTbTvJaaQV5I0SJA31hXPDJ";
  };
in
{
  userKey1 = user1.key;
  systemKey1 = system1.key;

  "root.age".publicKeys = user1.full ++ system1;
  "duan.age".publicKeys = user1.full ++ system1;
}
