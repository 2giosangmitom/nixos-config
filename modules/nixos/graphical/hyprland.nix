{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.hyprland;
in
{
  options.graphical.hyprland.enable = lib.mkEnableOption "Hyprland";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      grimblast
      swww
      wl-clipboard
    ];

    programs.light.enable = true;
    services.gnome.gnome-keyring.enable = true;
    services.hypridle.enable = true;
    programs.hyprlock.enable = true;
    programs.xwayland.enable = true;
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
