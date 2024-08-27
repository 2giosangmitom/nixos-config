{ inputs, lib, ... }:
{
  flake.nixosConfigurations =
    let
      mkHost =
        {
          hostname,
          system,
          username,
          fullname,
          email,
          extraModules ? [ ],
        }:
        let
          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit (lib) mkOption types;
        in
        {
          ${hostname} = inputs.nixpkgs.lib.nixosSystem {
            inherit system;

            modules = [
              inputs.home-manager.nixosModules.home-manager
              inputs.nix-index-database.nixosModules.nix-index
              ../modules/nixos
              ../hosts/${hostname}

              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                  };
                  users.${username} = {
                    imports = [
                      ../modules/home
                      ../hosts/${hostname}/home.nix
                    ];
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
                      default = email;
                      description = "The email of the user";
                    };
                  };
                };
              }

              {
                _module.args = {
                  inherit inputs;
                  inherit pkgs-unstable;
                };
              }
            ] ++ extraModules;
          };
        };
      mkHosts = systems: lib.mkMerge (map mkHost systems);
    in
    mkHosts [
      {
        hostname = "nixos";
        system = "x86_64-linux";
        username = "chien";
        fullname = "Vo Quang Chien";
        email = "voquangchien.dev@proton.me";
        extraModules = [
          ../extras/hardware/touchpad.nix
          ../extras/hardware/cpu/amd.nix
          ../extras/hardware/gpu/nvidia-prime.nix
          ../extras/hardware/gpu/nvidia.nix
          ../extras/hardware/gpu/radeon.nix
        ];
      }
    ];
}
