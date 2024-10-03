{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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
      "acpi_backlight=native"
    ];
  };
}
