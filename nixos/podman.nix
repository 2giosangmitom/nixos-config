{ pkgs-unstable, ... }:
{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      autoPrune.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    containers = {
      enable = true;
      registries.search = [
        "docker.io"
        "ghcr.io"
        "quay.io"
      ];
    };
  };
  environment.systemPackages = with pkgs-unstable; [ podman-compose ];
}
