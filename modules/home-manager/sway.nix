{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    rofi
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
    };
    config = rec {
      bars = [];
      fonts = {
        names = ["Roboto" "FiraCode Nerd Font"];
        style = "Regular";
        size = 9.0;
      };
      window = {
        border = 2;
        titlebar = false;
        hideEdgeBorders = "none";
      };
      floating = {
        titlebar = false;
        border = 2;
        criteria = [{"class" = "Pavucontrol";}];
      };
      colors = {
        background = "#1e1e2e";
        focused = {
          border = "#b4befe";
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#f5e0dc";
          childBorder = "#b4befe";
        };
        placeholder = {
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#6c7086";
          border = "#6c7086";
          childBorder = "#6c7086";
        };
        urgent = {
          background = "#1e1e2e";
          text = "#fab387";
          indicator = "#6c7086";
          border = "#fab387";
          childBorder = "#fab387";
        };
        unfocused = {
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#f5e0dc";
          border = "#6c7086";
          childBorder = "#6c7086";
        };
        focusedInactive = {
          border = "#6c7086";
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#6c7086";
          childBorder = "#6c7086";
        };
      };
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun";
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        outer = 0;
        inner = 5;
      };
      defaultWorkspace = "workspace number 1";
      startup = [
        {command = "waybar";}
      ];
      keybindings = {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+q" = "kill";
        "${modifier}+Shift+c" = "reload";

        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";

        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";

        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+a" = "focus parent";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+r" = "mode resize";
      };
    };
  };
}
