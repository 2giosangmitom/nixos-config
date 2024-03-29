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
      timeout = 5;
    };
    kernelParams = [
      "nowatchdog"
    ];
    kernel.sysctl = {
      # The sysctl swappiness parameter determines the kernel's preference for pushing anonymous pages or page cache to disk in memory-starved situations.
      # A low value causes the kernel to prefer freeing up open files (page cache),
      # a high value causes the kernel to try to use swap space, and a value of 100 means IO cost is assumed to be equal.
      "vm.swappiness" = 100;
      # Disable NMI watchdog
      "kernel.nmi_watchdog" = 0;
      # Disable core dumps
      "kernel.core_pattern" = "/dev/null";
    };
  };
}
