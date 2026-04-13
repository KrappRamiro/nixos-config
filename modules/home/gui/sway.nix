{
  lib,
  config,
  pkgs,
  ...
}: {
  options.sway.enable = lib.mkEnableOption "Enables Sway";

  options.sway.wallpapers = lib.mkOption {
    type = lib.types.nullOr lib.types.path;
    default = null;
    description = ''
      Directory of wallpaper images. Nix copies it to the store, making it
      deterministic and shared across machines via git. wpaperd rotates through
      all images in the directory. Set per-host in home.nix, e.g.:
        sway.wallpapers = ../../assets/wallpapers;
    '';
  };

  config = lib.mkIf config.sway.enable {
    home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";

    wayland.windowManager.sway = {
      enable = true;
      xwayland = true;

      config = rec {
        modifier = "Mod4";
        terminal = "ghostty";

        # Disable the built-in swaybar — we use waybar
        bars = [];

        startup =
          lib.optional config.mako.enable {command = "mako";}
          ++ lib.optional config.waybar.enable {command = "env TZ=America/Argentina/Buenos_Aires waybar";}
          ; # wpaperd runs as a systemd user service, no need to start it here

        input = {
          "type:keyboard" = {
            xkb_layout = "us,latam";
            accel_profile = "flat";
          };
          "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "enabled";
            dwt = "enabled"; # disable-while-typing
          };
        };

        floating.modifier = modifier;

        focus.followMouse = false;

        keybindings = lib.mkOptionDefault {
          # Launch programs
          "${modifier}+Return" = "exec ghostty";
          "${modifier}+space" = "exec rofi -show drun";

          # Kill window
          "${modifier}+q" = "kill";

          # Focus (vim-style)
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          # Move windows (vim-style)
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          # Floating toggle
          "${modifier}+f" = "floating toggle";

          # Workspaces
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";

          # Move container to workspace
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";

          # Switch keyboard layout (us ↔ latam)
          "${modifier}+Ctrl+Alt+space" = "input type:keyboard xkb_switch_layout next";

          # Screenshot
          "${modifier}+Shift+s" = "exec screenshotin";

          # Volume
          "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          # Screen brightness
          "XF86MonBrightnessUp" = "exec brightnessctl s 5%+";
          "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";

          # Media control
          "XF86AudioPlay" = "exec playerctl play-pause";
          "XF86AudioPause" = "exec playerctl play-pause";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";
        };
      };
    };

    services.wpaperd = lib.mkIf (config.sway.wallpapers != null) {
      enable = true;
      settings.any = {
        path = "${config.sway.wallpapers}";
        duration = "30m";
        sorting = "random";
      };
    };

    programs.swaylock = {
      enable = true;
      settings = {
        color = "000000";
        show-failed-attempts = true;
      };
    };

    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.swaylock}/bin/swaylock -f";
        }
        {
          timeout = 600;
          command = ''${pkgs.sway}/bin/swaymsg "output * power off"'';
          resumeCommand = ''${pkgs.sway}/bin/swaymsg "output * power on"'';
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock}/bin/swaylock -f";
        }
      ];
    };
  };
}
