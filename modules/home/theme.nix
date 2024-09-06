{ pkgs, ... }:
{
  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors";
      size = 20;
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
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      size = 20;
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors";
    };
  };
}
