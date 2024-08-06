{ config, lib, ... }:
let
  cfg = config.dotfiles.zellij;
in
{
  options.dotfiles.zellij = {
    enable = lib.mkEnableOption "Zellij";
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
    };
  };
}
