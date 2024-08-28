{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  cfg = config.graphical.hyprland;
  rgba = color: alpha: "rgba(${lib.removePrefix "#" color}${alpha})";
in
{
}
