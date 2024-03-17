{
  config,
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode"];})
      roboto
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Roboto"];
        sansSerif = ["Roboto"];
        monospace = ["FiraCode NF" "JetBrainsMono NF"];
      };
    };
  };
}
