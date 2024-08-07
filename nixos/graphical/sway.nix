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
  options.graphical.sway = {
    enable = lib.mkEnableOption "Sway";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
    };

    environment.variables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "sway";
      XDG_CURRENT_DESKTOP = "sway";
      GDK_BACKEND = "wayland,x11";
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    programs.sway = {
      enable = true;
      extraPackages = with pkgs; [
        swayidle
        gammastep
        wl-clipboard
        swaybg
        sway-contrib.grimshot
      ];

      wrapperFeatures = {
        base = true;
        gtk = true;
      };
    };
  };
}
