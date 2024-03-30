{pkgs-unstable, ...}: {
  imports = [
    ./tmux.nix
    ./bottom.nix
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
    ./vscode.nix
    ./bash.nix
  ];

  home = {
    username = "chien";
    homeDirectory = "/home/chien";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    packages = with pkgs-unstable; [
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
      rofi-wayland
      libnotify
      obs-studio
      gimp
      dconf
      tokei
      du-dust
    ];
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
