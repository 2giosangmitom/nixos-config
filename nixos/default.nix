{
  pkgs,
  config,
  ...
}: {
  catppuccin.enable = true;
  environment.systemPackages = with pkgs;
    [
      curl
      gnumake
      fd
      tokei
      du-dust
      ripgrep
      jq
      zip
      unzip
      clang
      procps
      xdg-utils
      bob-nvim
      eza
    ]
    ++ pkgs.lib.optionals config.isGraphical [
      brave
      gh
      pavucontrol
    ];
  security.polkit.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  systemd.services.systemd-journal-flush.enable = false;

  system.stateVersion = "24.05";
}
