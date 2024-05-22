{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./sway.nix
    ./lazygit.nix
    ./shell.nix
    ./git.nix
    ./waybar.nix
    ./yazi.nix
    ./neovim
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
    gtk3.extraConfig = {
      gtk-cursor-theme-name = "Vimix Cursors";
      gtk-enable-animations = 0;
    };
    font = {
      name = "Roboto";
      size = 10;
    };
    theme = {
      name = "Sweet-Dark-v40";
      package = pkgs.sweet;
    };
    enable = true;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
    cursorTheme = {
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
      size = 24;
    };
  };

  home = {
    file.".icons/default".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";
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
      clang
      vscode.fhs
    ];
    pointerCursor = {
      gtk.enable = true;
      size = 24;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };

    stateVersion = "24.05";
  };
}
