{ pkgs, ... }:
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
    package = pkgs.nixVersions.latest;
  };

  # Enable nix-ld
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  # Disable systemd journal flush
  systemd.services.systemd-journal-flush.enable = false;

  # Essential packages
  environment.systemPackages = with pkgs; [
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

    # Docker
    docker-compose
    docker-buildx
    lazydocker
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Enable docker rootless
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.11";
}
