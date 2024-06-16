{
  inputs,
  username,
}: {
  modules = [
    {
      home.username = username;
      xdg.mime.enable = true;
    }
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  extraSpecialArgs = {
    inherit inputs;
  };
}
