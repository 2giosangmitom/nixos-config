{
  boot = {
    tmp = {
      cleanOnBoot = true;
    };
    loader = {
      timeout = 5;
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
    };
    initrd.systemd.enable = true;
    kernelParams = [
      "nowatchdog"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 100;
      "kernel.nmi_watchdog" = 0;
      "kernel.core_pattern" = "/dev/null";
    };
  };
}
