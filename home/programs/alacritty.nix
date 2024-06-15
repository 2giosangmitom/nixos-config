{
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      shell = "bash";
      live_config_reload = true;
      font = {
        size = 10;
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono NF";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono NF";
          style = "Bold Italic";
        };
        bold = {
          family = "JetBrainsMono NF";
          style = "Bold";
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
  };
}
