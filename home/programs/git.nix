{ osConfig, ... }:
{
  programs.git = {
    enable = true;
    userName = osConfig.fullname;
    userEmail = osConfig.email;
    delta.enable = true;
  };
}
