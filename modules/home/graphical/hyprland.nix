{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  cfg = config.graphical.hyprland;
  rgba = color: alpha: "rgba(${lib.removePrefix "#" color}${alpha})";
in
{
  options.graphical.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs-unstable.hyprland;
      xwayland.enable = true;
      systemd.enable = true;

      settings = {
        bindm = [
          "SUPER,mouse:272,movewindow"
          "SUPER,mouse:273,resizewindow"
        ];
        general = {
          gaps_in = 10;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = rgba "#AD49E1" "aa";
          "col.inactive_border" = rgba "#EBD3F8" "aa";
        };
        binds = {
          movefocus_cycles_fullscreen = false;
        };
        input = {
          kb_layout = "us";
          touchpad.disable_while_typing = false;
          resolve_binds_by_sym = true;
        };
        exec =
          let
            autostart = lib.getExe (
              pkgs.writeShellScriptBin "autostart" ''
                # Terminate already running bar instances
                pkill waybar

                # Wait until the processes have been shut down
                while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

                # Start waybar
                waybar &
              ''
            );
          in
          [
            "hyprctl setcursor ${config.gtk.cursorTheme.name} ${toString config.gtk.cursorTheme.size}"
            autostart
          ];
        dwindle = {
          split_width_multiplier = 1.35;
          pseudotile = true;
        };
        misc = {
          vfr = true;
          close_special_on_empty = true;
          focus_on_activate = true;
          # Unfullscreen when opening something
          new_window_takes_over_fullscreen = 2;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        "$mod" = "SUPER";
        bind =
          [
            "$mod, Return, exec, alacritty"
            "$mod, D, exec, ~/.config/rofi/launch.sh launcher"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (
              builtins.genList (
                x:
                let
                  ws =
                    let
                      c = (x + 1) / 10;
                    in
                    builtins.toString (x + 1 - (c * 10));
                in
                [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              ) 10
            )
          );
        decoration = {
          active_opacity = 1.0;
          inactive_opacity = 0.85;
          fullscreen_opacity = 1.0;
          rounding = 5;
          blur = {
            enabled = true;
            size = 4;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
            popups = true;
          };
          drop_shadow = true;
          shadow_range = 12;
          shadow_offset = "3 3";
          "col.shadow" = "0x44000000";
          "col.shadow_inactive" = "0x66000000";
        };
        animations = {
          enabled = true;
          bezier = [
            "easein,0.1, 0, 0.5, 0"
            "easeinback,0.35, 0, 0.95, -0.3"

            "easeout,0.5, 1, 0.9, 1"
            "easeoutback,0.35, 1.35, 0.65, 1"

            "easeinout,0.45, 0, 0.55, 1"
          ];

          animation = [
            "fadeIn,1,3,easeout"
            "fadeLayersIn,1,3,easeoutback"
            "layersIn,1,3,easeoutback,slide"
            "windowsIn,1,3,easeoutback,slide"

            "fadeLayersOut,1,3,easeinback"
            "fadeOut,1,3,easein"
            "layersOut,1,3,easeinback,slide"
            "windowsOut,1,3,easeinback,slide"

            "border,1,3,easeout"
            "fadeDim,1,3,easeinout"
            "fadeShadow,1,3,easeinout"
            "fadeSwitch,1,3,easeinout"
            "windowsMove,1,3,easeoutback"
            "workspaces,1,2.6,easeoutback,slide"
          ];
        };
      };
    };
  };
}
