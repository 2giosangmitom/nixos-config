{inputs}: [
  (final: prev: let
    pkgs = import inputs.nixpkgs {inherit (prev) system;};
  in {
    bob-nvim = final.callPackage ./bob-nvim.nix {inherit pkgs;};
  })
]
