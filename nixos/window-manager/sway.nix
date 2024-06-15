{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.dotfiles.window-manager == "sway") {
    programs.dconf.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };

    programs.sway = {
      enable = true;

      extraPackages = with pkgs; [
        swayidle
        sway-contrib.grimshot
        wl-clipboard
        rofi-wayland
        swww
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
