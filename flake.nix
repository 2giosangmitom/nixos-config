{
  description = "2giosangmitom's NixOS configuration";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {flake-parts, ...} @ inputs: let
    overlays = import ./pkgs/overlays.nix;
    inherit (import ./hosts/lib.nix {inherit inputs overlays;}) mkSystems;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake.nixosConfigurations = mkSystems [
        {
          host = "nixos";
          system = "x86_64-linux";
          username = "chien";
          isGraphical = true;
        }
      ];
      flake.templates = {
        rust = {
          path = ./templates/rust;
          description = "Development environment for Rust";
        };
        nodejs = {
          path = ./templates/nodejs;
          description = "Development environment for NodeJS";
        };
        go = {
          path = ./templates/golang;
          description = "Development environment for Golang";
        };
      };

      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            nil
            alejandra
            statix
            deadnix
          ];
        };
        formatter = pkgs.alejandra;
      };
    };
}
