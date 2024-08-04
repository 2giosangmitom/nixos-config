{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_stable;
    tmp = {
      cleanOnBoot = true;
    };
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        timeoutStyle = "menu";
        configurationLimit = 10;
        useOSProber = false;
      };
      timeout = 1;
    };
    kernelParams = [
      "nowatchdog"
      "quiet"
      "splash"
      "mitigations=off"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 100;
      "kernel.nmi_watchdog" = 0;
      "kernel.core_pattern" = "/dev/null"; # Disable core dumps
    };
  };
}
