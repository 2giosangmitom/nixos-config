{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.dotfiles.docker;
in
{
  options.dotfiles.docker = {
    enable = lib.mkEnableOption "Docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    environment.systemPackages = with pkgs; [
      docker-compose
      docker-buildx
      lazydocker
    ];
  };
}
