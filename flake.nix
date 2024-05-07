{
  description = "2giosangmitom's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    # Defines the target system as x86_64-linux.
    system = "x86_64-linux";

    # Imports Nixpkgs for stable version with custom configuration.
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    # Imports Nixpkgs for unstable version with custom configuration.
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    # Function to generate NixOS system configuration for the given hostname.
    mkSystem = hostname: feature:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit pkgs-unstable;
          inherit pkgs;
        };
        modules = [
          {
            _module.args = {
              inherit pkgs-unstable;
              inherit pkgs;
            };
          }

          {
            networking.hostName = hostname;
            system.stateVersion = "23.11";
            nix.settings.experimental-features = ["nix-command" "flakes"];
          }

          # Includes custom module files for configuration.
          (./. + "/hosts/${hostname}/hardware-configuration.nix")
          (./. + "/modules/${feature}.nix")
          ./modules/boot.nix
          ./modules/networking.nix
          ./modules/locale.nix
          ./modules/sound.nix
          ./modules/programs.nix
          ./modules/services.nix
          ./modules/user.nix
          ./modules/fonts.nix

          # Includes Home Manager configuration.
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit pkgs;
                feature = feature;
              };
              # Imports user-specific Home Manager configuration.
              users.chien = import ./home;
            };
          }
        ];
      };
  in {
    # Defines available NixOS configurations.
    nixosConfigurations = {
      nixos = mkSystem "nixos" "hyprland"; # My desktop
    };
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs-unstable; [
        nodejs_20
        fish
        statix
        alejandra
        deadnix
        nil
      ];
      shellHook = ''
        exec fish
      '';
    };
    formatter.x86_64-linux = pkgs.alejandra;
  };
}
