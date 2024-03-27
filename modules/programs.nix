{pkgs-unstable, ...}: {
  environment.systemPackages = with pkgs-unstable; [git wireplumber];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.nix-ld.enable = true;
  programs.dconf.enable = true;
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    defaultEditor = true;
  };
  programs.xwayland.enable = true;
  programs.sway = {
    enable = true;
    package = pkgs-unstable.sway;
  };

  xdg.portal = {
    enable = false;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs-unstable; [
      xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };
}
