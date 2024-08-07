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
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "pulseaudio"
            "network"
            "tray"
          ];
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
          network = {
            tooltip = false;
            format = "{ifname}";
            format-wifi = "{icon} {essid}";
            format-ethernet = "<span color='#98ABEE'>󰈀 </span>Connected";
            format-disconnected = "No connection";
            format-icons = [
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
          };
        };
      };
      # style = ./style.css;
    };
  };
}
