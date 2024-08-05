{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.sway;
in
{
  options.graphical.sway = {
    enable = lib.mkEnableOption "Sway";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
    };

    programs.sway = {
      enable = true;
      extraPackages = with pkgs; [
        swayidle
        gammastep
        flameshot
        wl-clipboard
        swaybg
      ];

      wrapperFeatures = {
        base = true;
        gtk = true;
      };
    };
  };
}
