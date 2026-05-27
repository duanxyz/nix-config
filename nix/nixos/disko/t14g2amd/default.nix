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
              device = "/dev/disk/by-uuid/1AB5-785E";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0077"
                  "dmask=0022"
                ];
              };
            };

            root = {
              device = "/dev/disk/by-uuid/428c9015-2111-4329-bbc0-63fc9d7cae4b";
              content = {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "@log" = {
                    mountpoint = "/var/log";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };

                  "@cache" = {
                    mountpoint = "/var/cache";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
