{ config, lib, ... }:
let
  cfg = config.dotfiles.zoxide;
in
{
  options.dotfiles.zoxide = {
    enable = lib.mkEnableOption "Zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
