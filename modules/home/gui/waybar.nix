{
  lib,
  config,
  pkgs,
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
          modules-right = ["wireplumber" "custom/battery-profile" "tray"];

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

          # TODO: battery icons (format-icons) are not rendering despite JetBrainsMono Nerd Font
          # being installed. Replaced with plain text until root cause is found.
          "custom/battery-profile" = {
            exec = pkgs.writeShellScript "battery-profile" ''
              capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "?")
              start=$(cat /sys/class/power_supply/BAT0/charge_start_threshold 2>/dev/null || echo "?")
              stop=$(cat /sys/class/power_supply/BAT0/charge_stop_threshold 2>/dev/null || echo "?")
              behaviour=$(cat /sys/class/power_supply/BAT0/charge_behaviour 2>/dev/null | grep -oP '\[\K[^\]]+' || echo "?")

              if [ "''${behaviour}" = "inhibit-charge" ]; then
                profile="AC-only"
              else
                profile="''${start}-''${stop}%"
              fi

              class=""
              if [ "''${capacity}" -le 15 ] 2>/dev/null; then class="critical"
              elif [ "''${capacity}" -le 30 ] 2>/dev/null; then class="warning"
              fi

              echo "{\"text\": \"BAT: ''${capacity}% | ''${profile}\", \"class\": \"''${class}\"}"
            '';
            return-type = "json";
            interval = 30;
            rotate = 90;
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

        #custom-battery-profile {
          padding: 8px 0;
          color: #a6e3a1;
          font-size: 11px;
        }

        #custom-battery-profile.warning {
          color: #f9e2af;
        }

        #custom-battery-profile.critical {
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
