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
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
