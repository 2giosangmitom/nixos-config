{pkgs, ...}: {
  gtk = {
    gtk3.extraConfig = {
      gtk-cursor-theme-name = "Vimix Cursors";
      gtk-enable-animations = 0;
    };
    enable = true;
    font = {
      name = "Roboto";
      size = 10;
    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
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

  home.pointerCursor = {
    gtk.enable = true;
    size = 24;
    package = pkgs.vimix-cursors;
    name = "Vimix Cursors";
  };

  home.file.".icons/default".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";
}
