{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget2
    helix
    nixd
    nixfmt
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    htop
    iotop
  ];
}
