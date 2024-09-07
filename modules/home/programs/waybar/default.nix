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
            "tray"
          ];

          backlight = {
            format = "<span color='#fab387'>󰃠</span> {percent}%";
            tooltip = false;
          };

          cpu = {
            interval = 10;
            format = "<span color='#89b4fa'></span> {usage}%";
            states = {
              warning = 70;
              critical = 90;
            };
          };

          clock = {
            format = "<span color='#a6e3a1'>󰥔</span> {:%H:%M - %a, %d %b}";
          };

          temperature = {
            format = "<span color='#b4befe'></span> {temperatureC}°C";
            critical-threshold = 90;
            tooltip = false;
          };

          "sway/workspaces" = {
            disable-scroll = true;
            format = "{name}";
            disable-click = true;
            disable-markup = true;
            tooltip = false;
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
            format-wifi = "<span color='#8caaee'>{icon}</span> {ifname}";
            format-icons = [
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = "<span color='#8caaee'>󰈀</span> {ifname}";
            format-disconnected = "<span color='#8caaee'>󰇧</span> Disconnected";
            tooltip-format-wifi = "Connected to {essid}\nSignal strength: {signalStrength}%";
            tooltip-format-ethernet = "Ethernet: {ifname}";
            tooltip-format-disconnected = "No network connection";
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
            tooltip = false;
          };

          disk = {
            interval = 30;
            format = "<span color='#99d1db'>󰋊</span> {percentage_used}%";
            path = "/";
            unit = "GiB";
            tooltip-format = "{used} used out of {total} on {path}\nUsage: {percentage_used}%";
          };

          memory = {
            format = "<span color='#f9e2af'></span> {used:0.1f}GiB/{total:0.1f}GiB";
            tooltip-format = "RAM used: {percentage}%\nSwap used: {swapUsed}GiB\nTotal swap: {swapTotal}GiB";
          };
        };
      };
    };
  };
}
