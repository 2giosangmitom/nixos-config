{
  services = {
    printing.enable = false;
    gnome.gnome-keyring.enable = true;
  };
  systemd.services.systemd-journal-flush.enable = false;
}
