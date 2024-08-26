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

    ./graphical/sway.nix
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
    lshw
  ];

  systemd.services.systemd-journal-flush.enable = false;
  services.fstrim.enable = true;

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

  system.stateVersion = "24.05";
}
