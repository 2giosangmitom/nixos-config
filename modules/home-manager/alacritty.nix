{
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      shell = "fish";
      live_config_reload = true;
      font = {
        size = 10;
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
        bold = {
          family = "FiraCode Nerd Font";
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
