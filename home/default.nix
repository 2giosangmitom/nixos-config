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
      uutils-coreutils
      procps
      fastfetch
      hyprpaper
    ];
    stateVersion = "23.11";
  };

  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      size = 10;
    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
  };

  programs.rofi = import ./rofi.nix;
  programs.waybar = import ./waybar;
  wayland.windowManager.hyprland = import ./hyprland.nix;
  programs.alacritty = import ./alacritty.nix;
  programs.git = import ./git.nix;
  programs.fish = import ./fish.nix;
  programs.starship = import ./starship.nix;
  programs.lazygit = import ./lazygit.nix;
  programs.home-manager.enable = true;
}
