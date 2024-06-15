{pkgs, ...}: {
  gtk = {
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
    pointerCursor = {
      gtk.enable = true;
      size = 24;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };
  };
}
