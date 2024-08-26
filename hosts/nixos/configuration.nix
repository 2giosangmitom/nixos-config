{ pkgs-unstable, ... }:
{
  config = {
    time.timeZone = "Asia/Ho_Chi_Minh";
    i18n.defaultLocale = "en_US.UTF-8";
    common.sound.enable = true;
    graphical.sway.enable = true;
    dotfiles.docker.enable = true;
    i18n.inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs-unstable.ibus-engines; [ bamboo ];
    };
    environment.systemPackages = with pkgs-unstable; [ vesktop ];

    services = {
      asusd = {
        enable = true;
        enableUserService = true;
      };
      xserver.videoDrivers = [ "nvidia" ];
    };

    hardware.opengl.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
      prime = {
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    services.power-profiles-daemon.enable = true;
  };
}
