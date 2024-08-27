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
    programs.hyprland = {
      enable = true;
      package = pkgs-unstable.hyprland;
      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      systemd.setPath.enable = true;
    };

    environment.systemPackages = with pkgs-unstable; [
      grimblast
      hyprpicker
    ];

    services.hypridle.enable = true;
    programs.hyprlock.enable = true;
  };
}
