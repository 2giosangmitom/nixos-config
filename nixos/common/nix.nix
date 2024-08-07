{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "@wheel"
        "root"
      ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
    package = pkgs.nixVersions.nix_2_22;
  };
}
