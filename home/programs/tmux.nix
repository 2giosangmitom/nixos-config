{
  config,
  lib,
  pkgs-unstable,
  pkgs,
  ...
}:
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
      package = pkgs-unstable.tmux;
      prefix = "C-a";
      terminal = "screen-256color";
      shell = "${pkgs.zsh}/bin/zsh";
      customPaneNavigationAndResize = true;
      mouse = true;
      extraConfig = ''
        set -as terminal-features ",xterm-256color:RGB"
        set -s escape-time 10
        set -sg repeat-time 600
        set -s focus-events on
        set -g status-left-style NONE
        set -g status-right-style NONE
        set -q -g status-utf8 on
        setw -q -g utf8 on
        setw -g automatic-rename on
        set -g renumber-windows on
        set -g display-panes-time 800
        set -g display-time 1000
      '';
    };
  };
}
