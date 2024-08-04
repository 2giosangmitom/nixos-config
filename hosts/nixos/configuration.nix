{ pkgs, ... }:
{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Email
  email = "voquangchien.dev@proton.me";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  common.sound.enable = true;
  graphical.hyprland.enable = true;
  dotfiles.docker.enable = true;
  dotfiles.alacritty.enable = true;
}
