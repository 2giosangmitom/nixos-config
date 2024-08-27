{ pkgs, ... }:
{
  home = {
    pointerCursor = {
      gtk.enable = true;
      size = 16;
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
    };
  };
}
