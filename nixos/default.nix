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
            file
            fontconfig
            freetype
            fuse
            glib
            gtk3
            libGL
            libnotify
            libxml2
            libxslt
            netcat
            nspr
            nss
            openjdk8
            openssl.dev
            pango
            pkg-config
            strace
            udev
            vulkan-loader
            watch
            wget
            which
            xorg.libX11
            xorg.libxcb
            xorg.libXcomposite
            xorg.libXcursor
            xorg.libXdamage
            xorg.libXext
            xorg.libXfixes
            xorg.libXi
            xorg.libXrandr
            xorg.libXrender
            xorg.libXScrnSaver
            xorg.libxshmfence
            xorg.libXtst
            xorg.xcbutilkeysyms
            zlib
            fontconfig.lib
          ];
        profile = ''export FHS=1'';
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
