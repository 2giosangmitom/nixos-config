{ hostName }:
{
  networking.hostName = hostName;
  networking.proxy.noProxy = "127.0.0.1,localhost";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];
}
