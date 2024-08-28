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
          layout = "dwindle";
          allow_tearing = false;
          "col.active_border" = rgba "#AD49E1" "aa";
          "col.inactive_border" = rgba "#EBD3F8" "aa";
        };
        binds = {
          movefocus_cycles_fullscreen = false;
        };
        input = {
          kb_layout = "us";
          follow_mouse = 1;
          sensitivity = 0;
          numlock_by_default = false;
          touchpad = {
            disable_while_typing = false;
            natural_scroll = true;
            scroll_factor = 1.0;
          };
          resolve_binds_by_sym = true;
        };
        env = [
          "MOZ_ENABLE_WAYLAND, 1"
          "QT_QPA_PLATFORM, wayland"
          "QT_QPA_PLATFORMTHEME, qt5ct"
          "SDL_VIDEODRIVER, wayland"
          "GDK_SCALE, 2"
          "XCURSOR_SIZE, 24"
          "XDG_CURRENT_DESKTOP, hyprland"
          "XDG_SESSION_DESKTOP, hyprland"
          "XDG_SESSION_TYPE, wayland"
          "_JAVA_AWT_WM_NONREPARENTING, 1"
        ];
        xwayland.force_zero_scaling = true;
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
          no_gaps_when_only = true;
          force_split = 0;
          use_active_for_splits = true;
        };
        master = {
          no_gaps_when_only = true;
          new_on_top = true;
        };
        gestures = {
          workspace_swipe = true;
        };
        misc = {
          close_special_on_empty = true;
          new_window_takes_over_fullscreen = 2; # Unfullscreen when opening something
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          force_default_wallpaper = -1;
          mouse_move_enables_dpms = true;
          enable_swallow = false;
          key_press_enables_dpms = true;
          focus_on_activate = true;
          vfr = true;
          always_follow_on_dnd = true;
        };
        "$mod" = "SUPER";
        bind =
          [
            "$mod, Return, exec, alacritty"
            "$mod, D, exec, ~/.config/rofi/launch.sh launcher"
            "$mod, Q, killactive"
            "$mod, Space, togglefloating"
            "$mod, C, exec, hyprpicker -a"
            "SHIFT, Print, exec, grimblast --notify --freeze copy area"
            ", Print, exec, grimblast --notify copy screen"
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

            "$mod, Tab, togglespecialworkspace, magic"
            "$mod SHIFT, Tab, movetoworkspace, special:magic"
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
          rounding = 2;
          blur = {
            enabled = false;
          };
          drop_shadow = false;
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
      extraConfig = ''
        monitor = eDP-1, 1920x1080@144, 0x0, 1
      '';
    };
  };
}
