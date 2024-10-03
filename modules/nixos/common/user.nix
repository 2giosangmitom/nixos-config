{ username, fullName }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = fullName;
    initialPassword = "123";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };
}
