{ inputs, lib, ... }:
{
  flake.nixosConfigurations =
    let
      mkHost =
        {
          hostName,
          system,
          username,
          fullName,
          extraModules ? [ ],
        }:
        let
          inherit (lib) mkOption types;
        in
        {
          ${hostName} = inputs.nixpkgs.lib.nixosSystem {
            inherit system;

            modules = [
              inputs.home-manager.nixosModules.home-manager
              inputs.nix-index-database.nixosModules.nix-index
              ../modules/nixos
              (import ../modules/nixos/common/user.nix { inherit username fullName; })
              (import ../modules/nixos/common/networking.nix { inherit hostName; })
              ../hosts/${hostName}

              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  users.${username} = {
                    imports = [
                      ../modules/home
                      ../hosts/${hostName}/home.nix
                    ];
                  };
                };
              }

              {
                _module.args = {
                  inherit inputs;
                };
              }
            ] ++ extraModules;
          };
        };
      mkHosts = systems: lib.mkMerge (map mkHost systems);
    in
    mkHosts [
      {
        hostName = "nixos";
        system = "x86_64-linux";
        username = "chien";
        fullName = "Vo Quang Chien";
        extraModules = [
          ../extras/ssd.nix
          ../extras/asus.nix
          ../extras/battery.nix
        ];
      }
    ];
}
