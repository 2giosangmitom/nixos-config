{
  boot = {
    # Configuration for handling temporary files on boot.
    tmp = {
      cleanOnBoot = true; # Cleans temporary files on each boot.
    };
    # Configuration for boot loader.
    loader = {
      efi = {
        canTouchEfiVariables = true; # Allows modification of EFI variables.
      };
      grub = {
        enable = true; # Enables GRUB as the bootloader.
        devices = ["nodev"]; # Disables device-mapper support in GRUB.
        efiSupport = true;
        timeoutStyle = "menu";
      };
      timeout = 2;
    };
  };
}
