{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    rofi-wayland
    swww
    sway-contrib.grimshot
  ];

  imports = [./rofi];

  wayland.windowManager.sway = {
    enable = true;
    catppuccin.enable = true;
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
        criteria = [{"class" = "pavucontrol";}];
      };
      colors = {
        background = "$base";
        focused = {
          border = "$lavender";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$lavender";
        };
        placeholder = {
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#6c7086";
          border = "#6c7086";
          childBorder = "#6c7086";
        };
        urgent = {
          background = "$base";
          text = "$text";
          indicator = "$overlay0";
          border = "$peach";
          childBorder = "$peach";
        };
        unfocused = {
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          border = "$overlay0";
          childBorder = "$overlay0";
        };
        focusedInactive = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$overlay0";
        };
      };
      modifier = "Mod4";
      terminal = "alacritty";
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
        {command = "${./scripts/random_bg.sh}";}
      ];
      keybindings = {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+d" = "exec ${./rofi/launch.sh} launcher";
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
        "Shift+Print" = "exec grimshot copy area";
        "Print" = "exec grimshot copy screen";
        "${modifier}+i" = "exec ${./scripts/input_method.sh} -c";
        "${modifier}+Shift+i" = "exec ${./scripts/input_method.sh} -t";
        "${modifier}+Shift+e" = "exec ${./rofi/launch.sh} powermenu sway";

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
