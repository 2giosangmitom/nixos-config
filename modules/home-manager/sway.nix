{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
    };
    config = {
      smartGaps = true;
      smartBorders = "on";
      terminal = "alacritty";
    };
  };
}
