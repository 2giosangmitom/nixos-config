{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      height = 0;
      modules-left = ["clock" "hyprland/workspaces"];
      modules-center = ["custom/uptime"];
      modules-right = ["pulseaudio" "cpu" "memory" "tray"];
      clock = {
        format = "{:%b %d - %H:%M}";
        tooltip = false;
      };
      "hyprland/workspaces" = {
      };
      "custom/uptime" = {
        exec = ./uptime.sh;
        interval = "60";
        tooltip = false;
        format = "{}";
      };
      pulseaudio = {
        format = "<span color='#b4f9f8'>{icon}</span>{volume}%";
        tooltip = false;
        format-muted = "<span color='#f7768e'> Muted</span>";
        format-icons = {
          default = [" " " " " "];
        };
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        scroll-step = 5;
      };
      cpu = {
        format = "<span color='#bb9af7'></span> {usage}%";
        tooltip = false;
      };
      memory = {
        format = "<span color='#ff9e64'>󰍛</span> {used}/{total}";
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

    #workspaces button {
      padding: 0 4px;
      color: #c0caf5;
    }

    #workspaces button.active {
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
    #workspaces,
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
}
