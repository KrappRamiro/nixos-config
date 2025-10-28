{ pkgs, lib, config, ... }: {

  options = { hyprland.enable = lib.mkEnableOption "Enables Hyprland"; };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      # See https://gitlab.com/Zaney/zaneyos/-/blob/main/modules/home/hyprland/hyprland.nix?ref_type=heads
      enable = true;
      xwayland = { enable = true; };
      settings = {
        general = {
          "$mod" = "SUPER";
          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
            "$mod ALT, mouse:272, resizewindow"

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
            "$modifier,1,workspace,1"
            "$modifier,2,workspace,2"
            "$modifier,3,workspace,3"
            "$modifier,4,workspace,4"
            "$modifier,5,workspace,5"
            "$modifier,6,workspace,6"
            "$modifier,7,workspace,7"
            "$modifier,8,workspace,8"
            "$modifier,9,workspace,9"
            "$modifier,0,workspace,10"
            "$modifier SHIFT,1,movetoworkspace,1"
            "$modifier SHIFT,2,movetoworkspace,2"
            "$modifier SHIFT,3,movetoworkspace,3"
            "$modifier SHIFT,4,movetoworkspace,4"
            "$modifier SHIFT,5,movetoworkspace,5"
            "$modifier SHIFT,6,movetoworkspace,6"
            "$modifier SHIFT,7,movetoworkspace,7"
            "$modifier SHIFT,8,movetoworkspace,8"
            "$modifier SHIFT,9,movetoworkspace,9"
            "$modifier SHIFT,0,movetoworkspace,10"
          ];
        };
        decoration = {
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
