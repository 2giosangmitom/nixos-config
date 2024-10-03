{
  config = {
    graphical.hyprland.enable = true;
    # graphical.gnome.enable = true;
    services.hardware.openrgb.enable = true;
    hardware.enableRedistributableFirmware = true;
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = true;
  };
}
