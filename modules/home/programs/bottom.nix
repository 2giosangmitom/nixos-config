{ config, lib, ... }:
let
  cfg = config.dotfiles.bottom;
in
{
  options.dotfiles.bottom = {
    enable = lib.mkEnableOption "Bottom";
  };

  config = lib.mkIf cfg.enable {
    programs.bottom = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        flags = {
          dot_marker = true;
          current_usage = true;
          group_processes = true;
          regex = true;
          case_sensitive = false;
          tree = true;
          disable_gpu = false;
        };
      };
    };
  };
}
