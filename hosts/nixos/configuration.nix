{
  config,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [neovim git];
  system.stateVersion = "23.11";
}
