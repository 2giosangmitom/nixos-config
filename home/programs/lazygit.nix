{ config, lib, ... }:
let
  cfg = config.dotfiles.lazygit;
in
{
  options.dotfiles.lazygit = {
    enable = lib.mkEnableOption "Lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        gui = {
          windowSize = "normal";
          sidePanelWidth = 0.25;
          language = "en";
          showRandomTip = false;
          showBottomLine = false;
        };
        os = {
          editPreset = "nvim";
        };
      };
    };
  };
}
