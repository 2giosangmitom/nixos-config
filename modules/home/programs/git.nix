{ osConfig, ... }:
{
  programs.git = {
    enable = true;
    userName = osConfig.dotfiles.fullname;
    userEmail = osConfig.dotfiles.email;
    delta.enable = true;
  };
}
