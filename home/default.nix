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
    ./theme.nix
    ./programs/bat.nix
    ./programs/zoxide.nix
    ./programs/eza.nix
    ./programs/fzf.nix
  ];
  home = {
    stateVersion = "24.05";
    sessionVariables = {};
  };
  xdg = {
    enable = false;
    mimeApps = {
      enable = false;
      defaultApplications = {};
    };
  };
  programs.home-manager.enable = true;
}
