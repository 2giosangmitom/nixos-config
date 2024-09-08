{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/bottom.nix
    ./programs/eza.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/rofi.nix
    ./programs/starship.nix
    ./programs/fzf.nix
    ./programs/waybar
    ./programs/yazi.nix
    ./programs/zellij.nix
    ./programs/zoxide.nix
    ./programs/dunst.nix
    ./programs/fish.nix

    ./graphical/sway.nix
    ./theme.nix
  ];

  home = {
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}