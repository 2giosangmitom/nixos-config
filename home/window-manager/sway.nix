{
  lib,
  osConfig,
  config,
  ...
}: {
  config = lib.mkIf (config.isGraphical && (osConfig.dotfiles.window-manager == "sway")) {
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
          {
            command = "${./scripts/autostart.sh}";
            always = true;
          }
          {command = "${./scripts/random_bg.sh}";}
        ];
        keybindings = {
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+d" = "exec ${../programs/rofi/launch.sh} launcher ${../programs/rofi/launcher.rasi}";
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
          "${modifier}+Shift+e" = "exec ${../programs/rofi/launch.sh} powermenu sway ${../programs/rofi/powermenu.rasi} ${../programs/rofi/confirm.rasi}";

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

    programs.waybar = {
      enable = true;
      catppuccin.enable = true;
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
            "tooltip" = false;
            "format" = "<span color='#ea76cb'>{icon}</span> {temperatureC}°C";
            "format-icons" = ["" "" "" "" "" ""];
          };
          cpu = {
            format = "<span color='#eba0ac'>{icon}</span>{usage}%";
            format-icons = [" " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
            tooltip = false;
          };
          memory = {
            format = "<span color='#fab387'>{icon}</span>{used}/{total}";
            format-icons = [" " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
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
          color: @text;
        }

        #workspaces button {
          padding: 0 4px;
          color: @text;
        }

        #workspaces button.focused {
          color: @sapphire;
        }

        #workspaces button.urgent {
          color: @pink;
        }

        #workspaces button.persistent {
          color: @lavender;
        }

        #workspaces button:hover {
          background: @base;
        }

        #custom-uptime,
        #pulseaudio,
        #clock,
        #workspaces,
        #disk,
        #memory,
        #tray,
        #mode,
        #temperature,
        #cpu {
          background: @base;
          color: @text;
          margin: 2px 3px;
          padding: 0 10px;
          border-radius: 5px;
        }
      '';
    };
  };
}
