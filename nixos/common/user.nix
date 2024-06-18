{config, ...}: {
  users.users.${config.dotfiles.username} = {
    isNormalUser = true;
    description = "Vo Quang Chien";
    initialPassword = "123";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };
}
