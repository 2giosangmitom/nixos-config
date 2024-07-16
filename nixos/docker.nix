{ pkgs-unstable, ... }:
{
  virtualisation.docker.rootless = {
    enable = true;
    package = pkgs-unstable.docker_26;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs-unstable; [
    docker-compose
    docker-buildx
  ];
}
