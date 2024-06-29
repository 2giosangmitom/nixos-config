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
      bob-nvim
    ]
    ++ (with pkgs-unstable; [
      vscode.fhs
      brave
      gh
      pavucontrol
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
