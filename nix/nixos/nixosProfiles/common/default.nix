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

  services.journald = {
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFileSize=50M
      MaxRetentionSec=1month
    '';
  };
}
