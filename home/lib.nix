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

  extraSpecialArgs = let
    pkgs-unstable = import inputs.nixpkgs-unstable {config.allowUnfree = true;};
  in {
    inherit inputs;
    inherit pkgs-unstable;
  };
}
