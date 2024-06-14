{
  inputs,
  overlays,
}: rec {
  hmCommonConfig = {username}: (
    {
      config,
      pkgs,
      ...
    }: let
      homeLib = import ../home/lib.nix {inherit inputs username;};
    in {
      config = {
        nixpkgs = {inherit overlays;};
        home-manager = {
          inherit (homeLib) extraSpecialArgs;
          sharedModules = homeLib.modules;
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${username}.imports = [../home];
        };
      };
    }
  );

  mkSystem = {
    host,
    system,
    username,
    isGraphical ? false,
    extraModules ? [],
  }: let
    pkgs = import inputs.nixpkgs {inherit system;};
    inherit (pkgs.lib) mkOption types;
  in {
    nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };
      modules =
        [
          {
            options = {
              dotfiles = {
                username = mkOption {
                  type = types.str;
                  default = username;
                  description = "The username for user";
                };
                window-manager = mkOption {
                  type = types.nullOr (
                    types.enum ["sway" "hyprland"]
                  );
                  default = "sway";
                  description = "The window manager to use";
                };
              };
              isGraphical = mkOption {
                type = types.bool;
                default = isGraphical;
                description = "Whether the system is a graphical target";
              };
            };
            config.dotfiles.window-manager = pkgs.lib.mkIf (!isGraphical) null;
            config.networking.hostName = host;
          }
          ./${host}
          ../nixos/common
          inputs.catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.home-manager
        ]
        ++ [(hmCommonConfig {inherit username;})]
        ++ extraModules;
    };
  };

  mkSystems = systems: inputs.nixpkgs.lib.mkMerge (map mkSystem systems);
}
