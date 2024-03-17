{
  programs.waybar = {
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
    style = ./style.css;
  };
}
