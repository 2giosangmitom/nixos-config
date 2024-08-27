{
  config = {
    device.isHybrid = true;
    graphical.hyprland.enable = true;

    # Enable fstrim for SSD
    services.fstrim.enable = true;
  };
}
