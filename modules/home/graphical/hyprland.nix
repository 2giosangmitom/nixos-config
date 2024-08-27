{
  config,
  lib,
  pkgs-unstable,
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
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs-unstable.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
    };
  };
}
