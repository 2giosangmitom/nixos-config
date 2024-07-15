{
  networking = {
    firewall.enable = true;
    proxy.noProxy = "127.0.0.1,localhost";
    nameservers = ["8.8.8.8" "8.8.4.4"];
  };
}
