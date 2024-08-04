{
  config,
  lib,
  pkgs,
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
      package = pkgs.rofi-wayland;
    };
  };
}
