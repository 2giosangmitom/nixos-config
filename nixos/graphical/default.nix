{ lib, ... }:
{
  options.graphical = {
    enable = lib.mkEnableOption "Graphical environment";
  };
}
