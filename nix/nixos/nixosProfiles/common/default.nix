{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
let
  fontsLib = import (inputs.self + "/lib/fonts.nix");
in
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

  security = {
    polkit.enable = true;

    apparmor = {
      enable = true;
      packages = with pkgs; [ apparmor-profiles ];
    };
  };

  services.journald = {
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFileSize=50M
      MaxRetentionSec=1month
    '';
  };

  fonts.packages = fontsLib.packages pkgs;

  services.upower.enable = true;
}
