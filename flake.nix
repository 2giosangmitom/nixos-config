{
  description = "2giosangmitom's dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = with pkgs; [
          statix
          alejandra
          deadnix
          nil
          shellcheck
          shfmt
        ];
      in {
        devShell = pkgs.mkShell {
          buildInputs = packages;
        };
        formatter = pkgs.alejandra;
      }
    );
}
