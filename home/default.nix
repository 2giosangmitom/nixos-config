{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "chien";
    homeDirectory = "/home/chien";

    packages = with pkgs; [
      nnn
      curl
      unzip
      zip
      ripgrep
      jq
      fzf
      eza
      bottom
      brave
      gnumake
      gcc
      gammastep
      pavucontrol
      tmux
      gh
      fd
      wl-clipboard
      fcitx5
      xdg-utils
    ];
    stateVersion = "23.11";
  };

  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      size = 11;
    };
  };

  programs.rofi = import ./rofi.nix;
  #programs.waybar = import ./waybar.nix; #TODO
  wayland.windowManager.hyprland = import ./hyprland.nix;
  programs.alacritty = import ./alacritty.nix;
  programs.git = import ./git.nix;
  programs.fish = import ./fish.nix;
  programs.starship = import ./starship.nix;
  programs.lazygit = import ./lazygit.nix;
  #programs.hyprpaper = import ./hyprpaper.nix; #TODO
  programs.home-manager.enable = true;
}
