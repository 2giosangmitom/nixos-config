{
  services = {
    openssh.enable = true;
    printing.enable = false;
    gnome.gnome-keyring.enable = true;
  };
  security.polkit.enable = true;
}
