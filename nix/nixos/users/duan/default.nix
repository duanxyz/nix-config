{
  inputs,
  cell,
}:
{
  users.users.duan = {
    password = "nixos";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      fish
      git
    ];
  };
}
