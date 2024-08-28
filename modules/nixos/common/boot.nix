{ pkgs, ... }:
{
  boot = {
    # kernelPackages = pkgs.linuxPackages_xanmod_stable;
    consoleLogLevel = 3;
    tmp = {
      cleanOnBoot = true;
    };
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      timeout = 1;
    };
    kernelParams = [
      "nowatchdog" # Disable watchdog
      "quiet" # Quiet boot
      "mitigations=off" # Disable mitigations
      "acpi_backlight=native" # Allow systemd to set and save backlight state
      "loglevel=3" # Kernel log level
      "udev.log_level=3" # Udev log level
      "systemd.show_status=auto" # Disable systemd status messages
    ];
    kernel.sysctl = {
      "vm.swappiness" = 100;
      "kernel.nmi_watchdog" = 0;
      "kernel.core_pattern" = "/dev/null"; # Disable core dumps
    };
  };
}
