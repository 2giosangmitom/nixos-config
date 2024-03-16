{
  enable = true;
  settings = {
    shell = "fish";
    font = {
      size = 10;
      normal = {
        family = "JetBrainsMono NF";
        style = "Medium";
      };
    };
    colors = {
      primary = {
        background = "#0A0E14";
        foreground = "#B3B1AD";
      };
      normal = {
        black = "#01060E";
        red = "#EA6C73";
        green = "#91B362";
        yellow = "#F9AF4F";
        blue = "#53BDFA";
        magenta = "#FAE994";
        cyan = "#90E1C6";
        white = "#C7C7C7";
      };
      bright = {
        black = "#686868";
        red = "#F07178";
        green = "#C2D94C";
        yellow = "#FFB454";
        blue = "#59C2FF";
        magenta = "#FFEE99";
        cyan = "#95E6CB";
        white = "#FFFFFF";
      };
    };
    cursor = {
      thickness = 0.3;
      unfocused_hollow = true;
      style = {
        shape = "Block";
        blinking = "On";
      };
    };
    window = {
      dynamic_padding = true;
    };
  };
}
