{
  description = "2giosangmitom's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    self,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          {_module.args = {inherit inputs;};}

          ./hosts/nixos/configuration.nix
          ./modules/boot.nix
          ./modules/networking.nix
          ./modules/locale.nix
          ./modules/sound.nix
          ./modules/programs.nix
          ./modules/services.nix
          ./modules/user.nix
          ./modules/fonts.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.chien = import ./home;
            };
          }
        ];
      };
    };
    formatter.x86_64-linux = pkgs.alejandra;
  };
}
