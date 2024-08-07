{ config, lib, ... }:
let
  cfg = config.dotfiles.eza;
in
{
  options.dotfiles.eza = {
    enable = lib.mkEnableOption "Eza";
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      icons = true;
      extraOptions = [
        "--group"
        "--group-directories-first"
      ];
    };
  };
}
