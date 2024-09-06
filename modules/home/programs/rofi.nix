{
  config,
  lib,
  pkgs-unstable,
  ...
}:
let
  cfg = config.dotfiles.rofi;
in
{
  options.dotfiles.rofi = {
    enable = lib.mkEnableOption "Rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = pkgs-unstable.rofi-wayland;
    };

    home.file = {
      ".config/rofi" = {
        source = ./rofi;
        recursive = true;
      };
    };
  };
}
