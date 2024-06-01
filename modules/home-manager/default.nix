{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./sway.nix
    ./lazygit.nix
    ./shell.nix
    ./git.nix
    ./yazi.nix
    ./dunst.nix
    ./fastfetch.nix
  ];
  programs.home-manager.enable = true;
  catppuccin.flavor = "mocha";

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bottom = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      flags = {
        dot_marker = true;
        current_usage = true;
        group_processes = true;
        regex = true;
        case_sensitive = false;
        tree = true;
      };
    };
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
      jq
      gh
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
      bob-nvim
      procps
      xdg-utils
      tree
      libnotify
      discord
    ];
    pointerCursor = {
      gtk.enable = true;
      size = 24;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };

    stateVersion = "24.11";
  };
}
