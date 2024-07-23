{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      trusted-users = [
        "@sudo"
        "@wheel"
        "chien"
      ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
    package = pkgs.nixVersions.nix_2_22;
  };
}
