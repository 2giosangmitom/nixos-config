{
  pkgs,
  pkgs-unstable,
  config,
  ...
}:
{
  imports = [
    ./window-manager/sway.nix
    ./window-manager/hyprland.nix
    ./docker.nix
    ./podman.nix
    ./services.nix
  ];

  catppuccin.enable = true;

  environment.systemPackages =
    with pkgs;
    [
      bob-nvim
      mesa
      libva
    ]
    ++ (with pkgs-unstable; [
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
      bleachbit
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
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      roboto
      crimson-pro
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Roboto" ];
        sansSerif = [ "Roboto" ];
        monospace = [ "JetBrainsMono NF" ];
      };
    };
  };

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs-unstable; [ vpl-gpu-rt ];

  system.stateVersion = "24.05";
}
