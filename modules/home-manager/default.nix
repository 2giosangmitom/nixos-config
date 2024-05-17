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
  catppuccin.flavour = "mocha";

  programs.bottom = {
    enable = true;
    catppuccin.enable = true;
  };
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };
  xdg.enable = true;

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavour = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = ["normal"];
    };
  };

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
    ];

    stateVersion = "23.11";
  };
}
