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
      rofi
      waybar
      gnumake
      gcc
      gammastep
      pavucontrol
      tmux
      gh
      fd
      wl-clipboard
      fcitx5
    ];
    stateVersion = "23.11";
  };

  programs.alacritty = import ./alacritty.nix;
  programs.git = import ./git.nix;
  programs.fish = import ./fish.nix;
  programs.starship = import ./starship.nix;
  programs.lazygit = import ./lazygit.nix;
  programs.home-manager.enable = true;
}
