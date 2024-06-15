{
  inputs,
  username,
}: rec {
  hmStandaloneConfig = {
    home.username = username;
    isGraphical = false;
    xdg.mime.enable = true;
  };

  extraSpecialArgs = {
    inherit inputs;
  };

  modules = [
    (
      {
        osConfig,
        lib,
        ...
      }: let
        inherit (lib) mkOption types;
      in {
        options = {
          isGraphical = mkOption {
            default = osConfig.isGraphical;
            description = "Whether the system is a graphical target";
            type = types.bool;
          };
        };
      }
    )
    hmStandaloneConfig
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
}
