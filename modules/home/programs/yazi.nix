{ config, lib, ... }:
let
  cfg = config.dotfiles.yazi;
in
{
  options.dotfiles.yazi = {
    enable = lib.mkEnableOption "Yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      settings = {
        log = {
          enabled = false;
        };
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
        opener = {
          edit = [
            {
              run = ''nvim "$@"'';
              block = true;
            }
          ];
        };
      };
    };
  };
}
