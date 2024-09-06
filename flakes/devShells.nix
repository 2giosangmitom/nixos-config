{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nil
          nixfmt-rfc-style
        ];
      };
      formatter = pkgs.nixfmt-rfc-style;
    };
}
