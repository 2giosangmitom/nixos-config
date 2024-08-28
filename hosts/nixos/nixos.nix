{
  config = {
    device.isHybrid = true;
    graphical.hyprland.enable = true;
    graphical.gnome.enable = true;

    # Enable fstrim for SSD
    services.fstrim.enable = true;
  };
}
