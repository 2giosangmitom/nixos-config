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

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    defaultEditor = true;
  };

  virtualisation.docker = {
    enable = true;
    package = pkgs-unstable.docker;
  };
}
