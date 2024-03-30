{pkgs-unstable, ...}: {
  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
    xwayland.enable = true;
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs-unstable; [xdg-desktop-portal-hyprland];
  };
}
