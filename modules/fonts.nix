{pkgs, ...}: {
  # Font configuration section.
  fonts = {
    # Enables default font packages.
    enableDefaultPackages = true;
    # Specifies font packages to be installed.
    packages = with pkgs; [
      # Overrides Nerd Fonts with specified fonts.
      (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode"];})
      roboto
    ];

    # Fontconfig configuration.
    fontconfig = {
      # Default fonts configuration.
      defaultFonts = {
        serif = ["Roboto"]; # Sets serif font to Roboto.
        sansSerif = ["Roboto"]; # Sets sans-serif font to Roboto.
        monospace = ["JetBrainsMono NF"]; # Sets monospace font to FiraCode NF and JetBrainsMono NF.
      };
    };
  };
}
