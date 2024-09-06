{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.dotfiles.sway;
in
{
  options.dotfiles.sway.enable = lib.mkEnableOption "Sway";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures = {
        gtk = true;
      };
      config = rec {
        modifier = "Mod4";
        terminal = "alacritty";
        fonts = {
          names = [ "Roboto" ];
          style = "Regular";
          size = 10.0;
        };
        input = {
          "type:touchpad" = {
            dwt = "enabled";
            tap = "enabled";
            dwtp = "enabled";
            tap_button_map = "lrm";
            natural_scroll = "enabled";
          };
        };
        window = {
          border = 2;
          titlebar = false;
          hideEdgeBorders = "none";
        };
        floating = {
          titlebar = false;
          border = 2;
        };
        defaultWorkspace = "workspace number 1";
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
            text = "#cdd6f4";
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
            indicator = "#f5e0dc";
            childBorder = "#6c7086";
          };
        };
        startup =
          let
            autostart = lib.getExe (
              pkgs.writeShellScriptBin "autostart" ''
                # Terminate already running bar instances
                pkill waybar

                # Wait until the processes have been shut down
                while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

                # Start waybar
                waybar &
              ''
            );
          in
          [
            {
              command = autostart;
              always = true;
            }
          ];
        bars = [ ];
        left = "h";
        down = "j";
        up = "k";
        right = "l";
        output = {
          "*" = {
            bg = "${./bg.jpeg} fill";
          };
        };
        gaps = {
          smartGaps = true;
          smartBorders = "on";
          outer = 0;
          inner = 5;
        };
        keybindings = {
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+d" = "exec ~/.config/rofi/launch.sh launcher";
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
          "${modifier}+Shift+e" = "exec ~/.config/rofi/launch.sh powermenu";

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
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_SOURCE@ toggle";
          "XF86MonBrightnessDown" = "exec light -U 10";
          "XF86MonBrightnessUp" = "exec light -A 10";
        };
      };
      extraConfig = ''
        set $gnome-schema org.gnome.desktop.interface
        seat * xcursor_theme "Vimix-Cursors" 20

        exec_always {
          gsettings set $gnome-schema gtk-theme "Sweet-Dark-v40"
          gsettings set $gnome-schema icon-theme "Papirus-Dark"
          gsettings set $gnome-schema cursor-theme "Vimix-Cursors"
          gsettings set $gnome-schema font-name "Roboto"
        }
      '';
    };
  };
}
