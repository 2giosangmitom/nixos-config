{ pkgs, ... }:
{
  home = {
    pointerCursor = {
      gtk.enable = true;
      size = 16;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };
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
}
