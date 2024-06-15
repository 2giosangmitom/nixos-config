{config, ...}: {
  imports = [
    ./window-manager/sway.nix
  ];
  home = {
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
