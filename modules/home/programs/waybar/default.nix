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
          spacing = 10;
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 36;
          reload_style_on_change = false;
          margin-right = 10;
          margin-left = 10;
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "pulseaudio"
            "network"
            "backlight"
            "battery"
            "disk"
            "memory"
            "temperature"
            "cpu"
            "power-profiles-daemon"
            "tray"
          ];
          backlight = {
            format = "<span color='#fab387'>󰃠</span> {percent}%";
          };
          cpu = {
            interval = 10;
            format = "<span color='#89b4fa'></span> {usage}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };
          clock = {
            format = "<span color='#a6e3a1'>󰥔</span> {:%H:%M - %a, %d %b}";
            tooltip = false;
          };
          "sway/workspaces" = {
            disable-scroll = true;
            format = "{name}";
            disable-click = true;
            disable-markup = true;
          };
          pulseaudio = {
            format = "<span color='#f4b8e4'>{icon}</span> {volume}%";
            format-muted = "<span color='#e78284'></span> Muted";
            format-icons = [
              ""
              ""
              ""
            ];
            max-length = 10;
            tooltip = false;
          };
          network = {
            format = "{ifname}";
            format-wifi = "<span color='#8caaee'>{icon}</span> {signalStrength}";
            format-icons = [
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = "<span color='#8caaee'>󰈀</span> {ifname}";
            format-disconnected = "<span color='#8caaee'>󰇧</span> Disconnected";
            tooltip-format-wifi = "{essid} ({signalStrength}%)";
          };
          battery = {
            states = {
              warning = 20;
              critical = 10;
            };
            format = "<span color='#ca9ee6'>{icon}</span> {capacity}%";
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
            tooltip-format = "Status: {timeTo}\nHealth: {health}%";
          };
          disk = {
            interval = 30;
            format = "<span color='#99d1db'>󰋊</span> {percentage_used}%";
            path = "/";
            unit = "GiB";
            tooltip-format = "{used} used out of {total} on {path}";
          };
        };
      };
    };
  };
}
