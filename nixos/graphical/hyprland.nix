{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.hyprland;
in
{
  options.graphical.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      flameshot
      xfce.xfce4-appfinder
    ];
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
