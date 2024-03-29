{pkgs-unstable, ...}: {
  gtk = {
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
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
      package = pkgs-unstable.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
    iconTheme = {
      package = pkgs-unstable.tela-icon-theme;
      name = "Tela-dark";
    };
    cursorTheme = {
      package = pkgs-unstable.vimix-cursors;
      name = "Vimix Cursors";
      size = 24;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    size = 24;
    package = pkgs-unstable.vimix-cursors;
    name = "Vimix Cursors";
  };

  home.file.".icons/default".source = "${pkgs-unstable.vimix-cursors}/share/icons/Vimix-cursors";
}
