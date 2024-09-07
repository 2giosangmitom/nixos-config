{ pkgs-unstable, ... }:
{
  boot = {
    kernelPackages = pkgs-unstable.linuxPackages_zen;
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
      "quiet"
      "acpi_backlight=native"
      "loglevel=3"
    ];
  };
}
