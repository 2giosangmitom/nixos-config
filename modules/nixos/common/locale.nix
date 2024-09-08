{ pkgs-unstable, ... }:
{
  time = {
    timeZone = "Asia/Ho_Chi_Minh";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };

  environment.etc.environment.text = ''
    GTK_IM_MODULE=ibus
    QT_IM_MODULE=ibus
    XMODIFIERS=@im=ibus
  '';

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs-unstable.ibus-engines; [ bamboo ];
  };
}
