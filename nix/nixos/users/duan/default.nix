{
  inputs,
  cell,
}:
{
  users.users.duan = {
    hashedPasswordFile = config.age.secrets.duan.path;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
