{ config, lib, ... }:
let
  cfg = config.system.sound;
in
{
  options.system.sound = {
    enable = lib.mkEnableOption "sound support";
  };

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
