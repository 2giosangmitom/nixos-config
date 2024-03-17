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
        devices = ["nodev"];
        efiSupport = true;
        timeoutStyle = "menu";
      };
      timeout = 2;
    };
  };
}
