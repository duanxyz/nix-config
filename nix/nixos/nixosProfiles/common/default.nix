{
  inputs,
  cell,
}:
{
  environment.systemPackages = with pkgs; [
    wget2
    helix
    nixd
    nixfmt-rfc-style
    agenix
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
