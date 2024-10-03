{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.dotfiles.hyprland;
in
{
  options.dotfiles.hyprland.enable = lib.mkEnableOption "Hyprland";

  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/hypr/waybar.sh" = {
        source = ./scripts/waybar.sh;
      };
      ".config/hypr/background.sh" = {
        source = ./scripts/background.sh;
      };
    };

    dotfiles = {
      rofi.enable = true;
      waybar.enable = true;
      dunst.enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = ", preferred, auto, 1";
        general = {
          border_size = 2;
          gaps_in = 5;
          gaps_out = 10;
          gaps_workspaces = 0;
          "col.inactive_border" = "rgb(313244)";
          "col.active_border" = "rgb(94e2d5)";
          "col.nogroup_border" = "rgb(313244)";
          "col.nogroup_border_active" = "rgb(94e2d5)";
          layout = "dwindle";
          no_focus_fallback = true;
          resize_on_border = true;
        };
        dwindle = {
          pseudotile = false;
          no_gaps_when_only = 1;
        };
        exec = [
          "~/.config/hypr/waybar.sh"
          "~/.config/hypr/background.sh"
          "hyprctl setcursor ${config.gtk.cursorTheme.name} ${toString config.gtk.cursorTheme.size}"
        ];
        decoration = {
          rounding = 1;
          drop_shadow = false;
          blur = {
            enabled = false;
          };
        };
        input = {
          kb_layout = "us";
          numlock_by_default = true;
          accel_profile = "flat";
          scroll_method = "2fg";
          touchpad = {
            natural_scroll = true;
            tap-to-click = true;
          };
        };
        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
          workspace_swipe_distance = 200;
        };
        group = {
          "col.border_active" = "rgb(94e2d5)";
          "col.border_inactive" = "rgb(313244)";
          "col.border_locked_active" = "rgb(94e2d5)";
          "col.border_locked_inactive" = "rgb(313244)";
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          font_family = "Roboto";
          force_default_wallpaper = 0;
          disable_autoreload = true;
        };
        cursor = {
          no_hardware_cursors = true;
          hide_on_key_press = true;
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
        "$mod" = "SUPER";
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        bind =
          [
            "$mod, D, exec, ~/.config/rofi/launch.sh launcher"
            "$mod, Return, exec, alacritty"
            "$mod SHIFT, C, exec, hyprctl reload"
            "$mod, Q, killactive"
            "$mod, Space, togglefloating"
            "$mod SHIFT, E, exec, ~/.config/rofi/launch.sh powermenu"
            ",XF86MonBrightnessUp,exec,light -A 10"
            ",XF86MonBrightnessDown,exec,light -U 10"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", Print, exec, grimblast --notify copy output"
            "SHIFT,Print,exec,grimblast --notify --freeze copy area"
            "$mod, l, movefocus, r"
            "$mod, h, movefocus, l"
            "$mod, j, movefocus, d"
            "$mod, k, movefocus, u"
            "$mod SHIFT, l, swapwindow, r"
            "$mod SHIFT, h, swapwindow, l"
            "$mod SHIFT, j, swapwindow, d"
            "$mod SHIFT, k, swapwindow, u"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (
              builtins.genList (
                i:
                let
                  ws = i + 1;
                in
                [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
                ]
              ) 9
            )
          );
      };
      extraConfig = ''
        exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      '';
    };
  };
}
