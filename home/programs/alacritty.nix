{ config, lib, ... }:
let
  cfg = config.dotfiles.alacritty;
in
{
  options.dotfiles.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        shell = {
          program = "zsh";
          args = [
            "-c"
            "zellij"
          ];
        };
        font = {
          size = 10;
          normal = {
            family = "JetBrainsMono NF";
            style = "Regular";
          };
          italic = {
            family = "JetBrainsMono NF";
            style = "Italic";
          };
          bold_italic = {
            family = "JetBrainsMono NF";
            style = "Bold Italic";
          };
          bold = {
            family = "JetBrainsMono NF";
            style = "Bold";
          };
        };
        cursor = {
          thickness = 0.3;
          unfocused_hollow = true;
          style = {
            shape = "Block";
            blinking = "On";
          };
        };
        window = {
          dynamic_padding = true;
        };
      };
    };
  };
}
