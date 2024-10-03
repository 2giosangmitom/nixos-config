{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.gnome;
in
{
  options.graphical.gnome.enable = lib.mkEnableOption "GNOME";

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.excludePackages = with pkgs; [
      xterm
    ];
    services.xserver.desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [
        pkgs.gsettings-desktop-schemas # for org.gnome.desktop
        pkgs.gnome.gnome-shell # for org.gnome.shell
      ];
    };
    services.xserver.displayManager.gdm.enable = true;
    services.gnome.core-utilities.enable = false;
  };
}
