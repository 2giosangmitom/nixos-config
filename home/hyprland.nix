{pkgs-unstable, ...}: {
  home.packages = with pkgs-unstable; [
    grimblast
    hyprpaper
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    settings = let
      hyprpaper = ./hyprpaper.conf;
    in {
      "$mod" = "SUPER";
      exec-once = [
        "dbus-update-activation-environment --all"
        "waybar"
        "hyprpaper -c ${hyprpaper}"
        "dunst"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 0;
        sensitivity = 0;
      };
      monitor = ",preferred,auto,1";
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
        enable_swallow = false;
        key_press_enables_dpms = true;
        vfr = true;
      };

      bind = let
        terminal = "alacritty";
        rofi = ./rofi/launch.sh;
        launcher_theme = ./rofi/launcher.rasi;
        powermenu_theme = ./rofi/powermenu.rasi;
        confirm_theme = ./rofi/confirm.rasi;
        input_method = ./scripts/input_method.sh;
      in
        [
          "$mod,Return,exec,${terminal}"
          "$mod,D,exec,${rofi} launcher ${launcher_theme}"
          "$mod SHIFT,E,exec,${rofi} powermenu ${powermenu_theme} ${confirm_theme}"
          "$mod,Q,killactive,"
          "$mod,Space,togglefloating"
          "$mod,P,pseudo,"
          "$mod,E,togglesplit,"
          "$mod,I,exec,${input_method} -c"
          "$mod SHIFT,I,exec,${input_method} -t"

          "$mod,h,movefocus,l"
          "$mod,l,movefocus,r"
          "$mod,k,movefocus,u"
          "$mod,j,movefocus,d"

          "$mod SHIFT,h,movewindow,l"
          "$mod SHIFT,l,movewindow,r"
          "$mod SHIFT,k,movewindow,u"
          "$mod SHIFT,j,movewindow,d"

          ",Print,exec,grimblast --notify copy screen"
          "SHIFT,Print,exec,grimblast --notify copy area"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                workspace = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod,${workspace},workspace,${toString (x + 1)}"
                "$mod SHIFT,${workspace},movetoworkspace,${toString (x + 1)}"
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

  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = ["clock" "hyprland/workspaces"];
        modules-center = ["custom/uptime"];
        modules-right = ["pulseaudio" "temperature" "cpu" "memory" "tray"];
        clock = {
          format = "{:%b %d - %H:%M}";
          tooltip = false;
        };
        "hyprland/workspaces" = {
        };
        "custom/uptime" = {
          exec = ./scripts/uptime.sh;
          interval = "60";
          tooltip = false;
          format = "{}";
        };
        pulseaudio = {
          format = "<span color='#cba6f7'>{icon}</span>{volume}%";
          tooltip = false;
          format-muted = "<span color='#f38ba8'> </span>Muted";
          format-icons = {
            default = [" " " " " "];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };
        temperature = {
          tooltip = false;
          format = "<span color='#ea76cb'>{icon}</span> {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        cpu = {
          format = "<span color='#eba0ac'>{icon}</span>{usage}%";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
        memory = {
          format = "<span color='#fab387'>{icon}</span>{used}/{total}";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono NF";
        font-size: 12.5px;
        font-weight: bold;
      }

      window#waybar {
        background-color: transparent;
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 4px;
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #89dceb;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }

      #workspaces button.persistent {
        color: #f9e2af;
      }

      #workspaces button:hover {
        background: #1e1e2e;
      }

      #custom-uptime,
      #pulseaudio,
      #clock,
      #workspaces,
      #disk,
      #memory,
      #tray,
      #mode,
      #temperature,
      #cpu {
        background: #1e1e2e;
        color: #cdd6f4;
        margin: 2px 3px;
        padding: 0 10px;
        border-radius: 5px;
      }
    '';
  };
}
