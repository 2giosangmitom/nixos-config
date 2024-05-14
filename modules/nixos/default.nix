{pkgs, ...}: {
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
      timeout = 5;
    };
    kernelParams = [
      "nowatchdog"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 100;
      "kernel.nmi_watchdog" = 0;
      "kernel.core_pattern" = "/dev/null";
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [bamboo];
  };

  users.users.chien = {
    isNormalUser = true;
    description = "Vo Quang Chien";
    initialPassword = "123";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  services = {
    printing.enable = false;
    gnome.gnome-keyring.enable = true;
  };
  systemd.services.systemd-journal-flush.enable = false;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["FiraCode"];})
      roboto
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Roboto"];
        sansSerif = ["Roboto"];
        monospace = ["FiraCode NF"];
      };
    };
  };

  system.stateVersion = "23.11";
}
