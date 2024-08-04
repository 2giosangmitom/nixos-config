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
    environment.systemPackages = with pkgs; [
      flameshot
      wl-clipboard
    ];
    programs.sway = {
      enable = true;
    };
  };
}
