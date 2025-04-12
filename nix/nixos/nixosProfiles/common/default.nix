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
    htop
    iotop
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    allowedUDPPorts = [ ];
  };

  services.journald = {
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFileSize=50M
      MaxRetentionSec=1month
    '';
  };
}
