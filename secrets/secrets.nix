let
  user1 = {
    full = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMGbhllI0J4rudjJsjznXcentyVknzXIx1d6cB5rOjEN duan@semar";
    key = "AAAAC3NzaC1lZDI1NTE5AAAAIMGbhllI0J4rudjJsjznXcentyVknzXIx1d6cB5rOjEN";
  };

  system1 = {
    full = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF2KxEUWD9yKogFU3ak6aVgV4CRfyHC48CBApdSC5mzb root@semar";
    key = "AAAAC3NzaC1lZDI1NTE5AAAAIF2KxEUWD9yKogFU3ak6aVgV4CRfyHC48CBApdSC5mzb";
  };
in
{
  userKey1 = user1.key;
  systemKey1 = system1.key;

  "root.age".publicKeys = user1.full ++ system1;
  "duan.age".publicKeys = user1.full ++ system1;
}
