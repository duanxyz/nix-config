let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMGbhllI0J4rudjJsjznXcentyVknzXIx1d6cB5rOjEN duan@semar";
  user = [ user1 ];

  system1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF2KxEUWD9yKogFU3ak6aVgV4CRfyHC48CBApdSC5mzb root@semar";
  system = [ system1 ];
in
{
  "root.age".publicKeys = user ++ system;
  "duan.age".publicKeys = user ++ system;
}
