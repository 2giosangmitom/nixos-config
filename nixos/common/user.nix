{ config, ... }:
{
  users.users.${config.dotfiles.username} = {
    isNormalUser = true;
    description = config.dotfiles.fullname;
    initialPassword = "123";
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}
