{
  pkgs-unstable,
  feature,
  ...
}: let
  modules = [
    ./bottom.nix
    ./fish.nix
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
    (
      if feature == "hyprland"
      then ./hyprland.nix
      else ./sway.nix # TODO: add sway window manager
    )
  ];
in {
  imports = modules;

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
      tree-sitter
    ];
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
