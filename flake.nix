{
  description = "2giosangmitom's NixOS configuration for daily use";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    let
      inherit (import ./hosts/lib.nix { inherit inputs; }) mkHosts;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake.nixosConfigurations = mkHosts [
        {
          hostname = "nixos";
          system = "x86_64-linux";
          username = "chien";
          fullname = "Vo Quang Chien";
        }
      ];
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nil
              nixfmt-rfc-style
            ];
          };
        };
    };
}
