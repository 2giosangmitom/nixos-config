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

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    mkSystem = hostname:
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
              extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit pkgs;
              };
              users.chien = import ./home;
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      nixos = mkSystem "nixos"; # My desktop
    };
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
        nodejs_20
        fish
      ];
      shellHook = ''
        exec fish
      '';
    };
    formatter.x86_64-linux = pkgs.alejandra;
  };
}
