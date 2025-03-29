{
  inputs,
  cell,
}:
{
  users.users.duan = {
    hashedPasswordFile = config.age.secrets.duan.path;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      fish
      git
      brave
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
