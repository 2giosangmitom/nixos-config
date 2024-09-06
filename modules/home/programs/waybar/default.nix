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
          height = 40;
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-right = [
            "pulseaudio"
            "network"
            "backlight"
            "battery"
            "disk"
            "memory"
            "temperature"
            "cpu"
            "clock"
            "power-profiles-daemon"
            "tray"
          ];
        };
      };
      style = ./style.css;
    };
  };
}
