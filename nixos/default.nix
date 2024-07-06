{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: {
  imports = [
    ./window-manager/sway.nix
    ./window-manager/hyprland.nix
    ./docker.nix
    ./podman.nix
    ./services.nix
  ];

  catppuccin.enable = true;

  environment.systemPackages = with pkgs;
    [
      bob-nvim
      mesa
      libva

      (pkgs.buildFHSUserEnv {
        name = "minecraft-fhs";
        targetPkgs = pkgs:
          with pkgs; [
            alsa-lib
            atk
            cairo
            cups
            dbus
            expat
            fontconfig
            freetype
            gdk-pixbuf
            glib
            pango
            gtk3-x11
            gtk2-x11
            nspr
            nss
            stdenv.cc.cc
            zlib
            libuuid
            jre8
            cpio
            file
            giflib
            gnome2.GConf
            gnome2.gnome_vfs
            gtk2
            libjpeg
            libGL
            perl
            which
            xorg.libX11
            xorg.libxcb
            xorg.libXcomposite
            xorg.libICE
            xorg.libXinerama
            xorg.xrandr
            xorg.libXt
            zip
            zlib
            xorg.libXcursor
            xorg.libXdamage
            xorg.libXext
            xorg.libXfixes
            xorg.libXi
            xorg.libXrandr
            xorg.libXrender
            xorg.libXtst
            xorg.libXScrnSaver
            xorg.libXxf86vm
          ];
        profile = "export FHS=1";
        runScript = "bash";
      })
    ]
    ++ (with pkgs-unstable; [
      vscode.fhs
      brave
      gh
      pavucontrol
      curl
      gnumake
      fd
      tokei
      du-dust
      ripgrep
      jq
      zip
      unzip
      clang
      procps
      xdg-utils
      nix-index
      zstd
      go
      wget
      nodejs_20
      google-chrome
      firefox
    ]);

  security.polkit.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  systemd.services.systemd-journal-flush.enable = false;

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      roboto
      crimson-pro
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Roboto"];
        sansSerif = ["Roboto"];
        monospace = ["JetBrainsMono NF"];
      };
    };
  };

  system.stateVersion = "24.05";
}
