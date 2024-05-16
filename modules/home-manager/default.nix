{pkgs, ...}: {
  imports = [./alacritty.nix ./sway.nix ./lazygit.nix ./shell.nix ./git.nix ./neovim.nix];
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      curl
      brave
      rofi
    ];

    stateVersion = "23.11";
  };
}
