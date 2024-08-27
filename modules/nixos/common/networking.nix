{ config, ... }:
{
  networking.hostName = config.dotfiles.hostName;
  networking.proxy.noProxy = "127.0.0.1,localhost";
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };
  networking.networkmanager.wifi.backend = "iwd";
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];
}
