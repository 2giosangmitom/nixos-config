{pkgs-unstable, ...}: {
  xdg.portal = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
    xwayland.enable = true;
    portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
  };

  programs.xwayland.enable = true;
}
