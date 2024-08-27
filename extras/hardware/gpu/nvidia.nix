{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.device.isHybrid = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable hybrid graphics";
  };

  config = {
    services.xserver.videoDrivers = [ "nvidia" ];
    boot = {
      # Blacklist nouveau module as otherwise it conflicts with nvidia drm
      blacklistedKernelModules = [ "nouveau" ];
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    environment.systemPackages = with pkgs; [
      nvtopPackages.nvidia
      mesa
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      libva
      libva-utils
    ];

    hardware = {
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        modesetting.enable = true;

        # Hybrid graphics settings
        prime = lib.mkIf config.device.isHybrid {
          amdgpuBusId = "PCI:5:0:0";
          nvidiaBusId = "PCI:1:0:0";
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        };

        powerManagement = {
          enable = true;
          finegrained = false;
        };

        open = false;
        nvidiaSettings = false;
        nvidiaPersistenced = true;
        forceFullCompositionPipeline = true;
      };
    };
  };
}
