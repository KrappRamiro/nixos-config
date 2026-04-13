{
  lib,
  config,
  ...
}: {
  options.waybar.enable = lib.mkEnableOption "Enables Waybar status bar";

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;

      settings = [
        {
          layer = "top";
          position = "top";

          modules-left = ["sway/workspaces"];
          modules-center = ["clock"];
          modules-right = ["wireplumber" "battery" "tray"];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };

          clock = {
            format = "{:%a %d %b  %H:%M}";
            tooltip-format = "{calendar}";
          };

          wireplumber = {
            format = " {volume}%";
            format-muted = " muted";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          battery = {
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
            states = {
              warning = 30;
              critical = 15;
            };
          };

          tray = {
            spacing = 10;
          };
        }
      ];
    };
  };
}
