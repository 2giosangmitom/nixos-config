{ osConfig, lib, ... }:
let
  cfg = osConfig.graphical.hyprland;
in
{
  options.graphical.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = [
          "$mod, Return, exec, alacritty"
          ", Print, exec, flameshot gui"
          "$mod, Q, killactive,"
          "$mod, Space, togglefloating, "
          "$mod, D, exec, xfce-appfinder"
          "$mod, P, pseudo,"
          "$mod, J, togglesplit,"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
        ];
      };
    };
  };
}
