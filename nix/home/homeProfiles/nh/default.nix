{
  inputs,
  cell,
  config,
  ...
}:
let
  envFlake = builtins.getEnv "NH_FLAKE";
  flakePath = if envFlake != "" then envFlake else "${config.home.homeDirectory}/nix-config";
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
