{pkgs-unstable, ...}: {
  home.packages = with pkgs-unstable; [swaybg];

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
      bars = [{command = "waybar";}];
      output = {
        "*" = {bg = "/etc/nixos/backgrounds/luffy.png fill";};
      };
      keybindings = let
        rofi = ./rofi/launch.sh;
        launcher_theme = ./rofi/launcher.rasi;
        powermenu_theme = ./rofi/powermenu.rasi;
        confirm_theme = ./rofi/confirm.rasi;
      in {
        "${modifier}+q" = "kill";
        "${modifier}+d" = "exec ${rofi} launcher ${launcher_theme}";
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+Return" = "exec ${terminal} --class=termfloat";
        "${modifier}+Shift+e" = "exec ${rofi} powermenu ${powermenu_theme} ${confirm_theme}";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

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

        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+a" = "focus parent";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
      };
    };
    extraConfigEarly = ''
      gaps outer 0
      gaps inner 5
      smart_gaps on
      smart_borders on
      title_align center
      default_border pixel 2
      default_floating_border pixel 2
      for_window [class=".*"] border pixel 2
      for_window [app_id="termfloat"] floating enable
      focus_follows_mouse yes
    '';
  };

  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = ["clock" "sway/workspaces" "sway/mode"];
        modules-center = ["custom/uptime"];
        modules-right = ["pulseaudio" "temperature" "cpu" "memory" "tray"];
        clock = {
          format = "{:%b %d - %H:%M}";
          tooltip = false;
        };
        "sway/mode" = {
          tooltip = false;
        };
        "sway/workspaces" = {
          disable-click = true;
          disable-scroll = true;
          disable-markup = true;
        };
        "custom/uptime" = {
          exec = ./scripts/uptime.sh;
          interval = "60";
          tooltip = false;
          format = "{}";
        };
        pulseaudio = {
          format = "<span color='#cba6f7'>{icon}</span>{volume}%";
          tooltip = false;
          format-muted = "<span color='#f38ba8'> </span>Muted";
          format-icons = {
            default = [" " " " " "];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };
        temperature = {
          tooltip = false;
          format = "<span color='#ea76cb'>{icon}</span> {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        cpu = {
          format = "<span color='#eba0ac'>{icon}</span>{usage}%";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
        memory = {
          format = "<span color='#fab387'>{icon}</span>{used}/{total}";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono NF";
        font-size: 12.5px;
        font-weight: bold;
      }

      window#waybar {
        background-color: transparent;
        color: #c0caf5;
      }

      #workspaces {
        background: #24283b;
        margin: 2px 3px;
        border-radius: 5px;
        color: #c0caf5;
      }

      #workspaces button {
        padding: 0 2px;
      }

      #workspaces button.focused {
        color: #2ac3de;
      }

      #workspaces button.urgent {
        color: #f7768e;
      }

      #workspaces button.persistent {
        color: #414868;
      }

      #workspaces button:hover {
        background: #24283b;
        border: none;
      }

      #custom-uptime,
      #pulseaudio,
      #clock,
      #disk,
      #memory,
      #tray,
      #mode,
      #cpu {
        background: #24283b;
        margin: 2px 3px;
        padding: 0 10px;
        border-radius: 5px;
      }
    '';
  };
}
