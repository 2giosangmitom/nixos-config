{pkgs-unstable}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs-unstable.sway;
    systemd = true;
    xdgAutostart = true;
    wrapperFeatures = {
      gtk = true;
    };
    config = {
    };
  };
}
