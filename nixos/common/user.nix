{ config, ... }:
{
  users.users.${config.username} = {
    isNormalUser = true;
    description = config.fullname;
    initialPassword = "123";
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}
