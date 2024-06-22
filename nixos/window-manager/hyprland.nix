{
  config,
  pkgs-unstable,
  lib,
  ...
}: {
  config = lib.mkIf (config.dotfiles.window-manager == "hyprland") {
    environment.systemPackages = with pkgs-unstable; [
      wl-clipboard
      rofi-wayland
      swww
      gammastep
      grimblast
    ];

    programs.hyprland = {
      enable = true;
      package = pkgs-unstable.hyprland;
    };
  };
}
