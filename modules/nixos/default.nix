{ pkgs-unstable, ... }:
{
  imports = [
    ./common/boot.nix
    ./common/fonts.nix
    ./common/locale.nix
    ./common/shell.nix
    ./common/sound.nix

    ./graphical/sway.nix
  ];

  services.dbus.implementation = "broker";

  # Nix & Nixpkgs settings
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
    package = pkgs-unstable.nixVersions.latest;
  };

  # Enable nix-ld
  programs.nix-ld = {
    enable = true;
    package = pkgs-unstable.nix-ld-rs;
  };

  # Disable systemd journal flush
  systemd.services.systemd-journal-flush.enable = false;

  # Essential packages
  environment.systemPackages = with pkgs-unstable; [
    brave
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
    firefox
    vscode.fhs
    google-chrome

    # Docker
    docker-compose
    docker-buildx
    lazydocker
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs-unstable.neovim-unwrapped;
  };

  # Enable docker rootless
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.05";
}
