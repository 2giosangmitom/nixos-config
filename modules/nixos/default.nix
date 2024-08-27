{ pkgs-unstable, ... }:
{
  imports = [
    ./common/boot.nix
    ./common/fonts.nix
    ./common/locale.nix
    ./common/networking.nix
    ./common/shell.nix
    ./common/sound.nix
    ./common/user.nix

    ./graphical/hyprland.nix
  ];

  # Nix & Nixpkgs settings
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      # Enable the Flakes feature and the accompanying new nix command-line tool
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "@wheel"
        "root"
      ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
    package = pkgs-unstable.nixVersions.nix_2_22;
  };

  # Enable nix-ld
  programs.nix-ld = {
    enable = true;
    package = pkgs-unstable.nix-ld-rs;
  };

  # Disable systemd journal flush
  systemd.services.systemd-journal-flush.enable = false;

  # Enable fstrim for SSD
  services.fstrim.enable = true;

  # Essential packages
  environment.systemPackages = with pkgs-unstable; [
    brave
    gh
    pavucontrol
    curl
    gnumake
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
    lshw
    obs-studio
    go
    wget
    nodejs_20
    gimp

    # Docker
    docker-compose
    docker-buildx
    lazydocker
  ];

  # Enable docker rootless
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.05";
}
