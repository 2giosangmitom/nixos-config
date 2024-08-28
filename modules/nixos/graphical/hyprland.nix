{ config, lib, pkgs-unstable, ... }:
let
  cfg = config.graphical.hyprland;
in
{
  options.graphical.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };


  config = lib.mkIf cfg.enable {
    environment.variables = {
      NIXOS_OZONE_WL = "1";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs-unstable; [
      grimblast
      hyprpicker
      wl-clipboard
    ];

    services.hypridle.enable = true;
    programs.hyprlock.enable = true;
  };
}
