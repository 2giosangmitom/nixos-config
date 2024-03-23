{
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    settings = let
      hyprpaper = ./hyprpaper.conf;
    in {
      "$mod" = "SUPER";
      exec-once = ["waybar &" "hyprpaper -c ${hyprpaper}" "dunst &"];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        "col.inactive_border" = "0x00000000";
        layout = "dwindle";
        allow_tearing = false;
      };
      decoration = {
        rounding = 2;
        blur.enabled = false;
        drop_shadow = false;
      };
      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.3, 0, 0.2, -0.6"
          "easeinoutsine, 0.2, 0, 0.3, 1"
        ];
        animation = [
          "workspaces, 1, 2, default"
          "fade, 0"
          "windows, 1, 2, overshot, slide"
          "windowsOut, 1, 2, smoothOut, slide"
          "windowsMove, 1, 2, easeinoutsine, slide"
          "border, 1, 2, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        no_gaps_when_only = true;
        force_split = 0;
        use_active_for_splits = true;
      };
      master = {
        new_is_master = true;
        no_gaps_when_only = true;
      };
      gestures = {
        workspace_swipe = false;
      };
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(Alacritty)$";
        key_press_enables_dpms = true;
        vfr = true;
      };

      bind = let
        terminal = "alacritty";
        rofi = ./rofi/launch.sh;
        launcher_theme = ./rofi/launcher.rasi;
        powermenu_theme = ./rofi/powermenu.rasi;
        confirm_theme = ./rofi/confirm.rasi;
      in
        [
          "$mod,Return,exec,${terminal}"
          "$mod,D,exec,${rofi} launcher ${launcher_theme}"
          "$mod SHIFT,E,exec,${rofi} powermenu ${powermenu_theme} ${confirm_theme}"
          "$mod,Q,killactive,"
          "$mod,Space,togglefloating"
          "$mod,P,pseudo,"
          "$mod,E,togglesplit,"

          "$mod,h,movefocus,l"
          "$mod,l,movefocus,r"
          "$mod,k,movefocus,u"
          "$mod,j,movefocus,d"

          ",Print,exec,grimblast --notify copy screen"
          "SHIFT,Print,exec,grimblast --notify copy area"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod,${ws},workspace,${toString (x + 1)}"
                "$mod SHIFT,${ws},movetoworkspace,${toString (x + 1)}"
              ]
            )
            10)
        );

      bindm = [
        "$mod,mouse:272,movewindow"
        "$mod,mouse:273,resizewindow"
      ];
    };
  };
}
