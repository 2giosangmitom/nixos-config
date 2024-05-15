{pkgs, ...}: {
  imports = [./alacritty.nix ./sway.nix];
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      curl
      brave
    ];

    stateVersion = "23.11";
  };
}
