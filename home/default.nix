{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/yazi.nix
    ./programs/zellij.nix
    ./programs/zsh.nix

    ./graphical/hyprland.nix
  ];

  home = {
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
