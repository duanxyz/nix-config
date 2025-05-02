{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-ADATA_LEGEND_900_2P012LA7C9H9";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [
                  "defaults"
                  "noatime"
                ];
              };
            };
            swap = {
              size = "8G";
              content = {
                type = "swap";
              };
            };
            home = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
                mountOptions = [
                  "defaults"
                  "noatime"
                ];
              };
            };
          };
        };
      };
    };
  };
}
