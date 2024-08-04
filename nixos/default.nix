{ pkgs, ... }:
{
  imports = [
    ./common/boot.nix
    ./common/networking.nix
    ./common/nix.nix
    ./common/shell.nix
    ./common/sound.nix
    ./common/user.nix

    ./programs/docker.nix
    ./programs/neovim.nix
  ];

  environment.systemPackages = with pkgs; [
    mesa
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
    go
    wget
    nodejs_20
    bleachbit
    python3
    du-dust
  ];

  system.stateVersion = "24.05";
}
