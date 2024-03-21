{
  description = "2giosangmitom's NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    self,
  }: let
    mkSystem = hostname:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          {_module.args = {inherit inputs;};}
          {
            networking.hostName = hostname;
            system.stateVersion = "23.11";
            nix.settings.experimental-features = ["nix-command" "flakes"];
          }

          (./. + "/hosts/${hostname}/hardware-configuration.nix")
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
  in {
    nixosConfigurations = {
      nixos = mkSystem "nixos"; # My desktop
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
