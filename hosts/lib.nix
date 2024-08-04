{ inputs }:
rec {
  mkHost =
    {
      hostname,
      system,
      username,
      fullname,
    }:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
      inherit (pkgs.lib) mkOption types;
    in
    {
      ${hostname} = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-index-database.nixosModules.nix-index
          ./${hostname}
          ../nixos

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                imports = [ ../home ];
              };
            };
          }

          {
            options = {
              dotfiles = {
                hostName = mkOption {
                  type = types.str;
                  default = hostname;
                  description = "The hostname of the machine";
                };
                username = mkOption {
                  type = types.str;
                  default = username;
                  description = "The username for user";
                };
                fullname = mkOption {
                  type = types.str;
                  default = fullname;
                  description = "The full name of the user";
                };
                email = mkOption {
                  type = types.str;
                  default = "example@proton.me";
                  description = "The email of the user";
                };
              };
            };
          }

          {
            _module.args = {
              inherit inputs;
            };
          }
        ];
      };
    };

  mkHosts = systems: inputs.nixpkgs.lib.mkMerge (map mkHost systems);
}
