{ pkgs, ... }:
{
  imports = [
    ./common/boot.nix
    ./common/fonts.nix
    ./common/locale.nix
    ./common/sound.nix

    ./graphical/hyprland.nix
    ./graphical/gnome.nix
  ];

  programs.git = {
    enable = true;
  };

  programs.fish.enable = true;

  services.dbus.implementation = "broker";

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
    package = pkgs.nixVersions.latest;
  };

  # Enable nix-ld
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  # Essential packages
  environment.systemPackages = with pkgs; [
    brave
    git
    gh
    pavucontrol
    curl
    gnumake
    fastfetch
    fd
    tokei
    ripgrep
    jq
    zip
    unzip
    clang
    xdg-utils
    nix-index
    bleachbit
    python3
    du-dust
    obs-studio
    go
    wget
    nodejs_20
    gimp
    vscode.fhs
    libreoffice-fresh

    # Docker
    docker-compose
    docker-buildx
    lazydocker
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  xdg.mime.enable = true;

  system.stateVersion = "24.11";
}
