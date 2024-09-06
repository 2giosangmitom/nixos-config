{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      roboto
      crimson-pro
      noto-fonts
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      cache32Bit = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Roboto" ];
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono NF" ];
      };
    };
  };
}
