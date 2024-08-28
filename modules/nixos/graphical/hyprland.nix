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
    environment = {
      variables = {
        NIXOS_OZONE_WL = "1";
        GBM_BACKEND = "nvidia-drm";
        __GL_GSYNC_ALLOWED = "0";
        __GL_VRR_ALLOWED = "0";
        DISABLE_QT5_COMPAT = "0";
        ANKI_WAYLAND = "1";
        DIRENV_LOG_FORMAT = "";
        WLR_DRM_NO_ATOMIC = "1";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORMTHEME = "qt5ct";
        MOZ_ENABLE_WAYLAND = "1";
        WLR_BACKEND = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";
        XDG_SESSION_TYPE = "wayland";
        CLUTTER_BACKEND = "wayland";
      };
    };

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
      wl-clipboard
    ];

    services.hypridle.enable = true;
    programs.hyprlock.enable = true;
  };
}
