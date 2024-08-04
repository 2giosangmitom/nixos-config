{ pkgs, ... }:
{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/bottom.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/rofi.nix
    ./programs/yazi.nix
    ./programs/zellij.nix
    ./programs/zsh.nix

    ./graphical/sway.nix
  ];

  home = {
    pointerCursor = {
      gtk.enable = true;
      size = 16;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };

    file.".icons/default".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";

    stateVersion = "24.05";
  };

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-cursor-theme-name = "Vimix Cursors";
      gtk-enable-animations = 1;
    };

    font = {
      name = "Roboto";
      size = 10;
    };

    theme = {
      name = "Sweet-Dark-v40";
      package = pkgs.sweet;
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-dark";
    };
  };

  programs.home-manager.enable = true;
}
