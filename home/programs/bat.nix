{ config, lib, ... }:
let
  cfg = config.dotfiles.bat;
in
{
  options.dotfiles.bat = {
    enable = lib.mkEnableOption "Bat";
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };
  };
}
