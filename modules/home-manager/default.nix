{pkgs, ...}: {
  imports = [./alacritty.nix ./sway.nix ./lazygit.nix ./shell.nix ./git.nix ./waybar.nix];
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      curl
      brave
      gnumake
      gammastep
      pavucontrol
      fd
      tokei
      du-dust
      ripgrep
    ];

    stateVersion = "23.11";
  };
}
