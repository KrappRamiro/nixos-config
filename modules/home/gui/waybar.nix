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
          position = "left";
          width = 50;

          modules-left = ["sway/workspaces"];
          modules-center = ["clock"];
          modules-right = ["wireplumber" "battery" "tray"];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            format = "{index}";
          };

          clock = {
            format = "{:%H:%M}";
            tooltip-format = "{:%A, %d %B %Y}";
            rotate = 90;
          };

          wireplumber = {
            format = "{icon}";
            format-muted = "";
            format-icons = ["" "" ""];
            tooltip-format = "{volume}%";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          battery = {
            format = "{icon}";
            format-icons = ["" "" "" "" ""];
            tooltip-format = "{capacity}%";
            states = {
              warning = 30;
              critical = 15;
            };
          };

          tray = {
            icon-size = 18;
            spacing = 8;
          };
        }
      ];

      style = ''
        * {
          font-family: "JetBrainsMono Nerd Font", monospace;
          font-size: 13px;
          border: none;
          border-radius: 0;
          min-width: 0;
          min-height: 0;
        }

        window#waybar {
          background-color: rgba(26, 27, 38, 0.95);
          color: #cdd6f4;
          border-right: 1px solid #313244;
        }

        #workspaces {
          padding: 4px 0;
        }

        #workspaces button {
          all: unset;
          padding: 8px 0;
          min-width: 50px;
          min-height: 36px;
          color: #6c7086;
          font-size: 14px;
          transition: all 0.15s;
        }

        #workspaces button:hover {
          background-color: #313244;
          color: #cdd6f4;
        }

        #workspaces button.focused {
          color: #cba6f7;
          background-color: #313244;
        }

        #workspaces button.urgent {
          color: #f38ba8;
        }

        #clock {
          padding: 12px 0;
          color: #a6e3a1;
          font-size: 11px;
        }

        #wireplumber {
          padding: 8px 0;
          color: #89b4fa;
          font-size: 16px;
        }

        #wireplumber.muted {
          color: #6c7086;
        }

        #battery {
          padding: 8px 0;
          color: #a6e3a1;
          font-size: 16px;
        }

        #battery.warning {
          color: #f9e2af;
        }

        #battery.critical {
          color: #f38ba8;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        @keyframes blink {
          to { color: #ff0000; }
        }

        #tray {
          padding: 8px 0;
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          color: #f38ba8;
        }
      '';
    };
  };
}
