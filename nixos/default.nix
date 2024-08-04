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

  system.stateVersion = "24.05";
}
