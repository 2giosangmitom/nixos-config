{
  config,
  lib,
  pkgs-unstable,
  ...
}:
let
  cfg = config.dotfiles.fish;
in
{
  options.dotfiles.fish = {
    enable = lib.mkEnableOption "Fish";
  };

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      package = pkgs-unstable.fish;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAliases = {
        cat = "bat";

        ls = "eza";
        ll = "eza -l";
        la = "eza -a";
        lt = "eza -T";
        lla = "eza -la";
        llt = "eza -lT";

        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
      };
    };
  };
}
