{
  config,
  pkgs,
  lib,
  ...
}: {
  config = lib.mkIf (config.dotfiles.window-manager == "hyprland") {
    programs.hyprland.enable = true;
  };
}
