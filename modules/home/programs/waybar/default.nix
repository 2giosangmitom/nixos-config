{ config, lib, ... }:
let
  cfg = config.dotfiles.waybar;
in
{
  options.dotfiles.waybar = {
    enable = lib.mkEnableOption "Waybar";
  };

  config = lib.mkIf cfg.enable {
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
          modules-left = [
            "hyprland/workspaces"
            # "hyprland/window"
          ];
          modules-right = [
            "clock"
            "pulseaudio"
            "network"
            "battery"
            "memory"
            "cpu"
            "tray"
          ];
          clock = {
            format = "{:%b %d - %H:%M}";
            tooltip = false;
          };
          battery = {
            tooltip = false;
            format = "<span color='#A1D6B2'>{icon}</span> {capacity}%";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          "hyprland/workspaces" = {
            active-only = false;
          };
          pulseaudio = {
            format = "<span color='#cba6f7'>{icon}</span>{volume}%";
            tooltip = false;
            format-muted = "<span color='#f38ba8'> </span>Muted";
            format-icons = {
              default = [
                " "
                " "
                " "
              ];
            };
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            scroll-step = 5;
          };
          cpu = {
            format = "<span color='#eba0ac'> </span>{usage}%";
            tooltip = false;
          };
          memory = {
            format = "<span color='#fab387'> </span>{used}/{total}";
            tooltip = false;
          };
          network = {
            tooltip = false;
            format = "{ifname}";
            format-wifi = "<span color='#98ABEE'>{icon} </span>{essid}";
            format-ethernet = "<span color='#98ABEE'>󰈀 </span>Connected";
            format-disconnected = "<span color='#98ABEE'> </span>No connection";
            format-icons = [
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
          };
        };
      };
      style = ./style.css;
    };
  };
}
