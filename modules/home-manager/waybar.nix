{
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
        modules-center = [];
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
        # "custom/uptime" = {
        #   exec = ./scripts/uptime.sh;
        #   interval = "60";
        #   tooltip = false;
        #   format = "{}";
        # };
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
        font-family: "FiraCode Nerd Font";
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
}
