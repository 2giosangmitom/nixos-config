{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/dust.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/yazi.nix
    ./programs/zellij.nix
    ./programs/zsh.nix
  ];

  home = {
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
