{
  pkgs,
  ...
}:
{
  # NOTE: sshd sengaja tidak diaktifkan; laptop ini tidak pernah diakses via SSH.
  # Kalau nanti perlu, aktifkan services.openssh dengan PasswordAuthentication = false
  # dan PermitRootLogin = "no" (firewall otomatis membuka port 22 lewat openFirewall).
  networking.firewall.enable = true;

  security = {
    polkit.enable = true;

    apparmor = {
      enable = true;
      packages = with pkgs; [ apparmor-profiles ];
    };
  };
}
