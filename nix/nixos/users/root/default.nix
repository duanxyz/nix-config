{
  inputs,
  cell,
}:
{
  users.users.root.hashedPasswordFile = config.age.secrets.root.path;
}
