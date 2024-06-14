{
  description = "2giosangmitom's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {flake-parts, ...} @ inputs: let
    overlays = import ./pkgs/overlays.nix;
    inherit (import ./hosts/lib.nix {inherit inputs overlays;}) mkSystems;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = mkSystems [
        {
          host = "nixos";
          system = "x86_64-linux";
          username = "chien";
          isGraphical = true;
        }
      ];
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            nil
            alejandra
            statix
          ];
        };
        formatter = pkgs.alejandra;
      };
    };
}
