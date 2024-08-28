{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.graphical.gnome;
in
{
  options.graphical.gnome = {
    enable = lib.mkEnableOption "Gnome";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    hardware.pulseaudio.enable = false;

    environment.gnome.excludePackages =
      (with pkgs; [
        gnome-photos
        gnome-tour
        gedit
      ])
      ++ (with pkgs.gnome; [
        cheese
        gnome-music
        gnome-terminal
        geary
        evince
        gnome-characters
        totem
        tali
        iagno
        atomix
        hitori
      ]);
  };
}
