{
  boot = {
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
        useOSProber = true;
      };
      timeout = 5;
    };
    kernelParams = [ "nowatchdog" ];
    kernel.sysctl = {
      "vm.swappiness" = 100;
      "kernel.nmi_watchdog" = 0;
      "kernel.core_pattern" = "/dev/null";
    };
  };
}
