{ config, lib, ... }:
let
  cfg = config.common.sound;
in
{
  options.common.sound = {
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
