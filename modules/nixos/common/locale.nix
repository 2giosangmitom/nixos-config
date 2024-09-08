{ pkgs-unstable, ... }:
{
  time = {
    timeZone = "Asia/Ho_Chi_Minh";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  environment.etc.environment.text = ''
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    SDL_IM_MODULE=fcitx
  '';

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs-unstable; [ fcitx5-bamboo fcitx5-gtk ];
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
