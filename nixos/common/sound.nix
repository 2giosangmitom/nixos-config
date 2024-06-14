{config, ...}: {
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = config.isGraphical;
      pulse.enable = true;
      alsa.enable = true;
    };
  };
}
