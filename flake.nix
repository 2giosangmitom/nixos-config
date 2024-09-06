{
  description = "2giosangmitom's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      flake.templates = {
        nodejs = {
          path = ./templates/nodejs;
          description = "Development environment for NodeJS";
        };
        go = {
          path = ./templates/go;
          description = "Development environment for Golang";
        };
      };

      imports = [
        ./flakes/devShells.nix
        ./flakes/nixosConfigurations.nix
      ];
    };
}
