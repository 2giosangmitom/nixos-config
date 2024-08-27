{ config, lib, ... }:
let
  cfg = config.dotfiles.fzf;
in
{
  options.dotfiles.fzf = {
    enable = lib.mkEnableOption "Fzf";
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
