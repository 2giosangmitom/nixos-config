{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [git];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nix-ld.enable = true;

  programs.dconf.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    defaultEditor = true;
  };

  programs.xwayland.enable = true;

  virtualisation.docker = {
    enable = true;
    package = pkgs-unstable.docker;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [xdg-desktop-portal-hyprland];
  };
}
