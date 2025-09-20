{
  config,
  lib,
  pkgs,
  inputs,
  cell,
  ...
}:
{
  zramSwap = {
    enable = true;
    memoryPercent = 75;
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 90;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_ratio" = 20;
    "vm.dirty_background_ratio" = 5;
    "kernel.dmesg_restrict" = 1;
    "kernel.kptr_restrict" = 2;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";
    };
  };
}
