{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.sway;
in
{
  options.graphical.sway.enable = lib.mkEnableOption "Sway";

  config = lib.mkIf cfg.enable {
    programs.light.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.polkit.enable = true;
    programs.sway.enable = true;
    programs.sway.extraPackages = with pkgs; [
      swayidle
      gammastep
      wl-clipboard
      swaybg
      sway-contrib.grimshot
    ];
    environment.sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "sway";
      XDG_CURRENT_DESKTOP = "sway";
      GDK_BACKEND = "wayland,x11";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XWAYLAND_NO_GLAMOR = "1";
    };
    programs.xwayland.enable = true;
    programs.sway.wrapperFeatures = {
      base = true;
      gtk = true;
    };
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}
