{ config, lib, ... }:
let
  cfg = config.dotfiles.tmux;
in
{
  options.dotfiles.tmux = {
    enable = lib.mkEnableOption "Tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      prefix = "C-a";
      terminal = "screen-256color";
      shell = "zsh";
    };
  };
}
