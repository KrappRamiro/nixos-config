{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {hyprland.enable = lib.mkEnableOption "Enables Hyprland";};

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      # See https://gitlab.com/Zaney/zaneyos/-/blob/main/modules/home/hyprland/hyprland.nix?ref_type=heads
      enable = true;
      # Docs say: If you use the Home Manager module, make sure to disable the systemd integration, as it conflicts with uwsm.
      # see https://wiki.hypr.land/Useful-Utilities/Systemd-start/
      systemd.enable = false;
      xwayland = {enable = true;};
      settings = {
        general = {
          "$mod" = "SUPER";
          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
            "$mod ALT, mouse:272, resizewindow"
          ];

          # e flag, Will repeat when held.
          binde = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
          ];

          bind = [
            # Launching programs
            "$mod, Return, exec, alacritty"
            "$mod, SPACE, exec, rofi -show drun"

            # Killing a window
            "$mod, Q, killactive"

            # Moving windows around
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, L, movewindow, r"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, J, movewindow, d"

            # Set window as floating
            # See mouse bindings in bindm
            "$mod, f, togglefLoating"

            # Selecting another window
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, K, movefocus, u"
            "$mod, J, movefocus, d"

            # Workspace config
            "$mod, 1,workspace,1"
            "$mod, 2,workspace,2"
            "$mod, 3,workspace,3"
            "$mod, 4,workspace,4"
            "$mod, 5,workspace,5"
            "$mod, 6,workspace,6"
            "$mod, 7,workspace,7"
            "$mod, 8,workspace,8"
            "$mod, 9,workspace,9"
            "$mod, 0,workspace,10"
            "$mod SHIFT,1,movetoworkspace,1"
            "$mod SHIFT,2,movetoworkspace,2"
            "$mod SHIFT,3,movetoworkspace,3"
            "$mod SHIFT,4,movetoworkspace,4"
            "$mod SHIFT,5,movetoworkspace,5"
            "$mod SHIFT,6,movetoworkspace,6"
            "$mod SHIFT,7,movetoworkspace,7"
            "$mod SHIFT,8,movetoworkspace,8"
            "$mod SHIFT,9,movetoworkspace,9"
            "$mod SHIFT,0,movetoworkspace,10"

            # Volume and media control, also see same section in binde
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

            # Screen brightness
            ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
            ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

            # Control music with keyboard
            ", XF86AudioPlay,  exec, playerctl play-pause"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioNext,  exec, playerctl next"
            ", XF86AudioPrev,  exec, playerctl previous"
          ];
        };
        input = {
          accel_profile = "flat";
        };
        decoration = {
          # animation = NAME, ONOFF, SPEED, CURVE [,STYLE]
          animation = "workspaces, 0";
          rounding = 20;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            ignore_opacity = false;
            new_optimizations = true;
          };
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
        };
      };
    };
  };
}
