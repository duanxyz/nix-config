{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget2
    helix
    nixd
    nixfmt-rfc-style
    agenix
    htop
    iotop
  ];
}
