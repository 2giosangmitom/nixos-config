{
  inputs,
  username,
  system,
}: {
  modules = [
    {
      home.username = username;
      xdg.mime.enable = true;
    }
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  extraSpecialArgs = let
    pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    inherit inputs;
    inherit pkgs-unstable;
  };
}
