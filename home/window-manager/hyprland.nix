{
  lib,
  nixosConfig,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf (nixosConfig.isGraphical && nixosConfig.dotfiles.window-manager == "hyprland") {
    fonts.fontconfig.enable = true;
    services = {
      gnome-keyring = {
        enable = true;
      };
    };
    wayland.windowManager.hyprland = {
      enable = true;
      catppuccin.enable = true;
      package = pkgs-unstable.hyprland;
      settings = {
        exec-once = [
          "${./scripts/autostart.sh}"
          "${./scripts/random_bg.sh}"
          "hyprctl setcursor default 16"
        ];
        "$mod" = "SUPER";
        bind =
          [
            "$mod, Return, exec, alacritty"
            ", Print, exec, grimblast copy area"
            "$mod, Q, killactive,"
            "$mod, Space, togglefloating, "
            "$mod, D, exec, ${../programs/rofi/launch.sh} launcher ${../programs/rofi/launcher.rasi}"
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
          ]
          ++ (
            builtins.concatLists (builtins.genList (
                x: let
                  ws = let
                    c = (x + 1) / 10;
                  in
                    builtins.toString (x + 1 - (c * 10));
                in [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              )
              10)
          );
        misc = {
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
        input = {
          kb_layout = "us";
          follow_mouse = 1;
          sensitivity = 0;
          numlock_by_default = true;
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
        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 2;
          "col.active_border" = "$pink";
          "col.inactive_border" = "$overlay0";
          layout = "dwindle";
          allow_tearing = false;
        };
        env = [
          "MOZ_ENABLE_WAYLAND, 1"
          "NIXOS_OZONE_WL, 1"
          "QT_QPA_PLATFORM, wayland"
          "SDL_VIDEODRIVER, wayland"
          "XDG_CURRENT_DESKTOP, hyprland"
          "XDG_SESSION_DESKTOP, hyprland"
          "XDG_SESSION_TYPE, wayland"
          "_JAVA_AWT_WM_NONREPARENTING, 1"
        ];
        decoration = {
          rounding = 2;
          blur = {
            enabled = false;
          };
          drop_shadow = false;
        };
      };
    };

    programs.waybar = {
      enable = true;
      catppuccin.enable = true;
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
            "tooltip" = false;
            "format" = "<span color='#ea76cb'>{icon}</span> {temperatureC}°C";
            "format-icons" = ["" "" "" "" "" ""];
          };
          cpu = {
            format = "<span color='#eba0ac'>{icon}</span>{usage}%";
            format-icons = [" " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
            tooltip = false;
          };
          memory = {
            format = "<span color='#fab387'>{icon}</span>{used}/{total}";
            format-icons = [" " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
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
          color: @text;
        }

        #workspaces button {
          padding: 0 4px;
          color: @text;
        }

        #workspaces button.active {
          color: @sapphire;
        }

        #workspaces button.urgent {
          color: @pink;
        }

        #workspaces button.persistent {
          color: @lavender;
        }

        #workspaces button:hover {
          background: @base;
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
          background: @base;
          color: @text;
          margin: 2px 3px;
          padding: 0 10px;
          border-radius: 5px;
        }
      '';
    };
  };
}
