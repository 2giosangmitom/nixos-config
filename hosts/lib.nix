{
  inputs,
  overlays,
}: rec {
  hmCommonConfig = {username}: {pkgs, ...}: let
    inherit (pkgs) system;
    homeLib = import ../home/lib.nix {inherit inputs username system;};
  in {
    config = {
      nixpkgs.overlays = overlays;
      home-manager = {
        inherit (homeLib) extraSpecialArgs;
        sharedModules = homeLib.modules;
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username}.imports = [../home];
      };
    };
  };

  mkSystem = {
    host,
    system,
    username,
    isGraphical ? false,
    extraModules ? [],
  }: let
    pkgs = import inputs.nixpkgs {inherit system;};
    pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
    inherit (pkgs.lib) mkOption types;
  in {
    ${host} = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules =
        [
          {
            options = {
              dotfiles.username = mkOption {
                type = types.str;
                default = username;
                description = "The username for user";
              };
              dotfiles.window-manager = mkOption {
                type = types.nullOr (types.enum ["sway" "hyprland"]);
                default = "sway";
                description = "The window manager to use";
              };
              isGraphical = mkOption {
                type = types.bool;
                default = isGraphical;
                description = "Whether the system is a graphical target";
              };
            };
            config = {
              dotfiles.window-manager = pkgs.lib.mkIf (!isGraphical) null;
              networking.hostName = host;
            };
          }
          ./${host}
          ../nixos/common
          ../nixos
          inputs.catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.home-manager
          (hmCommonConfig {inherit username;})
          {
            _module.args = {
              inherit inputs;
              inherit pkgs-unstable;
            };
          }
        ]
        ++ extraModules;
    };
  };

  mkSystems = systems: inputs.nixpkgs.lib.mkMerge (map mkSystem systems);
}
