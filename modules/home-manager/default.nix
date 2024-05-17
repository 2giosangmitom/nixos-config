{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./sway.nix
    ./lazygit.nix
    ./shell.nix
    ./git.nix
    ./waybar.nix
    ./yazi.nix
  ];
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      curl
      brave
      gnumake
      gammastep
      pavucontrol
      fd
      tokei
      du-dust
      ripgrep
      obs-studio
      gimp
      eza
      zip
      unzip
      bat
    ];

    stateVersion = "23.11";
  };
}
