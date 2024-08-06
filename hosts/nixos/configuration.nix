{ pkgs-unstable, ... }:
{
  config = {
    time.timeZone = "Asia/Ho_Chi_Minh";
    i18n.defaultLocale = "en_US.UTF-8";
    common.sound.enable = true;
    graphical.sway.enable = true;
    dotfiles.docker.enable = true;
    i18n.inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs-unstable.ibus-engines; [ bamboo ];
    };
  };
}
