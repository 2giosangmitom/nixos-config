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
      settings = {
        simplified_ui = true;
        default_shell = "fish";
        theme = "catppuccin-mocha";
        themes = {
          catppuccin-mocha = {
            bg = "#585b70";
            fg = "#cdd6f4";
            red = "#f38ba8";
            green = "#a6e3a1";
            blue = "#89b4fa";
            yellow = "#f9e2af";
            magenta = "#f5c2e7";
            orange = "#fab387";
            cyan = "#89dceb";
            black = "#181825";
            white = "#cdd6f4";
          };
        };
      };
    };
  };
}
