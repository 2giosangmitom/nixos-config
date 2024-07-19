{
  config,
  pkgs-unstable,
  lib,
  ...
}:
{
  config = lib.mkIf (config.dotfiles.window-manager.sway == true) {
    programs.dconf.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs-unstable; [ xdg-desktop-portal-gtk ];
      xdgOpenUsePortal = true;
    };

    programs.sway = {
      enable = true;
      package = pkgs-unstable.sway;

      extraPackages = with pkgs-unstable; [
        swayidle
        sway-contrib.grimshot
        wl-clipboard
        rofi-wayland
        swww
        gammastep
      ];

      extraSessionCommands = ''
        # Set session type and desktop environment to wayland and sway
        export XDG_SESSION_TYPE=wayland
        export XDG_SESSION_DESKTOP=sway
        export XDG_CURRENT_DESKTOP=sway

        # Set environment variables for wayland support
        export NIXOS_OZONE_WL=1
        export MOZ_ENABLE_WAYLAND=1
        export QT_QPA_PLATFORM=wayland
        export SDL_VIDEODRIVER=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';

      wrapperFeatures = {
        base = true;
        gtk = true;
      };
    };
  };
}
