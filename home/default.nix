{
  imports = [
    ./window-manager/sway.nix
    ./window-manager/hyprland.nix
    ./programs/bash.nix
    ./programs/starship.nix
    ./programs/alacritty.nix
    ./programs/fastfetch.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/yazi.nix
    ./programs/dunst.nix
    ./programs/bottom.nix
  ];
  home = {
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
