{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
    ];
    extraPackages32 = [ pkgs.vaapiVdpau ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    nvidia-vaapi-driver
    pciutils
    vdpauinfo
  ];

  boot.extraModprobeConfig = ''
    blacklist nouveau
  '';

  boot.kernelModules = [
    "nvidia"
    "nvidia-drm"
  ];

  boot.kernelParams = [
    "rd.driver.blacklist=nouveau"
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
