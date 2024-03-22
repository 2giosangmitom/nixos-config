{
  config,
  pkgs,
  pkgs-unstable,
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
    ./fzf.nix
  ];

  home = {
    username = "chien";
    homeDirectory = "/home/chien";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    packages = with pkgs; [
      curl
      unzip
      bat
      zip
      ripgrep
      jq
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
      du-dust
      delta
    ];
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
