{
  enable = true;
  settings = {
    "$mod" = "SUPER";
    monitor = ",preferred,auto,auto";
    exec-once = "waybar";

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;
    };
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      layout = "dwindle";
      allow_tearing = false;
    };
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
        "overshot, 0.05, 0.9, 0.1, 1.05"
        "smoothOut, 0.3, 0, 0.2, -0.6"
        "smoothIn, 0.25, 1, 0.5, 1"
      ];
      animation = [
        "windows, 1, 2, overshot, slide"
        "windowsOut, 1, 2, smoothOut, slide"
        "windowsMove, 1, 3, default"
        "border, 1, 5, default"
        "fade, 1, 3, smoothIn"
        "fadeDim, 1, 3, smoothIn"
        "workspaces, 1, 2, default"
      ];
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
      no_gaps_when_only = true;
    };
    master = {
      new_is_master = true;
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
    };

    bind = let
      terminal = "alacritty";
      launcher = "rofi -show drun";
    in
      [
        "$mod,Return,exec,${terminal}"
        "$mod,D,exec,${launcher}"
        "$mod,Q,killactive,"
        "$mod,M,exit,"
        "$mod,Space,togglefloating"
        "$mod,P,pseudo,"
        "$mod,E,togglesplit,"

        "$mod,h,movefocus,l"
        "$mod,l,movefocus,r"
        "$mod,k,movefocus,u"
        "$mod,j,movefocus,d"

        "$mod,mouse:272,movewindow"
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
  };
}
