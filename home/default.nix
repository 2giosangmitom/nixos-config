{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./tmux.nix
    ./bottom.nix
    ./waybar
    ./fish.nix
    ./hyprland.nix
    ./alacritty.nix
    ./dunst.nix
    ./lazygit.nix
    ./git.nix
    ./starship.nix
    ./theme.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  home = {
    username = "chien";
    homeDirectory = "/home/chien";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      curl
      unzip
      zip
      ripgrep
      jq
      fzf
      eza
      brave
      gnumake
      gcc
      gammastep
      pavucontrol
      gh
      fd
      wl-clipboard
      xdg-utils
      procps
      fastfetch
      hyprpaper
      rofi
      libnotify
      grimblast
      obs-studio
      gimp
      dconf
      tokei
    ];
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
