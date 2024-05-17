{pkgs, ...}: {
  imports = [./alacritty.nix ./sway.nix ./lazygit.nix ./shell.nix ./git.nix ./waybar.nix ./theme.nix];
  programs.home-manager.enable = true;
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };

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
