{
  services = {
    printing.enable = false;
  };
  systemd.services.systemd-journal-flush.enable = false;
}
