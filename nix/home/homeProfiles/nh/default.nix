{
  inputs,
  cell,
  config,
  ...
}:
let
  flakePath = "${config.home.homeDirectory}/nix-config/";
in
{
  programs.nh = {
    enable = true;
    homeFlake = flakePath;
    osFlake = flakePath;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 3";
    };
  };
}
