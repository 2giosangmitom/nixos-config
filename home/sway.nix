{pkgs-unstable, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs-unstable.sway;
    systemd = {
      enable = true;
      xdgAutostart = true;
    };
    wrapperFeatures = {
      gtk = true;
    };
    config = rec {
      modifier = "Mod4";
      floating.modifier = "Mod4";
      terminal = "alacritty";
    };
  };
}
