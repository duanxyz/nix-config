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
    nixfmt-rfc-style
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    htop
    iotop
  ];
}
