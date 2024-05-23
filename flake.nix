{
  description = "NixOS configuration for a reproducible and customizable system.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (import ./overlays/bob-nvim.nix)
      ];
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit pkgs;
        };
        modules = [
          ./hosts/nixos
          ./modules/nixos
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit pkgs;
              };
              users.chien = {
                imports = [
                  ./modules/home-manager
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            };
          }
        ];
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nodejs_22
        nil
        alejandra
        statix
      ];
    };
    formatter.${system} = pkgs.alejandra;
  };
}
