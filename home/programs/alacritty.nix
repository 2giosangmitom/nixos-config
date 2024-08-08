{ config, lib, ... }:
let
  cfg = config.dotfiles.alacritty;
in
{
  options.dotfiles.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        shell = "tmux";
        env = {
          TERM = "xterm-256color";
        };
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
        colors = {
          primary = {
            foreground = "#F8EDE3";
            background = "#0C0C0C";
          };
          normal = {
            black = "#1A2130";
            red = "#C80036";
            green = "#379777";
            yellow = "#FFF078";
            blue = "#6EACDA";
            magenta = "#FF0080";
            cyan = "#5DEBD7";
            white = "#FCF8F3";
          };
        };
      };
    };
  };
}
