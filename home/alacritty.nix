{pkgs-unstable, ...}: {
  programs.alacritty = {
    enable = true;
    package = pkgs-unstable.alacritty;
    settings = {
      shell = "tmux";
      live_config_reload = true;
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = 10;
        normal = {
          family = "JetBrainsMono NF";
          style = "Medium";
        };
      };
      colors.indexed_colors = [
        {
          index = 16;
          color = "#FAB387";
        }
        {
          index = 17;
          color = "#F5E0DC";
        }
      ];
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
        };
        cursor = {
          text = "#1E1E2E";
          cursor = "#F5E0DC";
        };
        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };
        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };
        footer_bar = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
        hints = {
          start = {
            foreground = "#1E1E2E";
            background = "#F9E2AF";
          };
          end = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };
        search = {
          matches = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
          focused_match = {
            foreground = "#1E1E2E";
            background = "#A6E3A1";
          };
        };
        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
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
