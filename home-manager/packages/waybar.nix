{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        #             // "layer" = "top"; // Waybar at top layer
        position = "top";
        #             //   "height" = 5; // Waybar height (to be removed for auto height)
        #             // "width" = 1280; // Waybar width
        spacing = 4;
        #             // Choose the order of the modules
        #           "margin" = 0;
        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = ["tray" "pulseaudio" "network" "temperature" "cpu"];
        #             // Modules configuration
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name} = {icon}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
        };
        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = ["" ""];
          tooltip = true;
          tooltip-format = "{app} = {title}";
        };
        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime =%M =%S}/{totalTime =%M =%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };
        "tray" = {
          icon-size = 21;
          spacing = 10;
          icons = {
            blueman = "bluetooth";
            TelegramDesktop = "$HOME/.local/share/icons/hicolor/16x16/apps/telegram.png";
          };
        };
        "clock" = {
          #                 // "timezone" = "America/New_York";
          format = "{:%H:%M}";
          #                 "tooltip-format" = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          tooltip = false;
          format-alt = "{:%H:%M}";
          interval = 1;
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };
        "memory" = {
          format = "{}% ";
        };
        "temperature" = {
          #                 // "thermal-zone" = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          #                 "critical-threshold" = 80;
          #                 // "format-critical" = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };
        "backlight" = {
          #                 // "device" = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        #             "power-profiles-daemon" = {
        #               "format" = "{icon}";
        #               "tooltip-format" = "Power profile = {profile}\nDriver = {driver}";
        #               "tooltip" = true;
        #               "format-icons" = {
        #                 "default" = "0";
        #                 "performance" = " ";
        #                 "balanced" = "󰚀 ";
        #                 "power-saver" = " ";
        #               };
        #             };
        "network" = {
          #                 // "interface" = "wlp2*"; // (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 󰖟";
          tooltip-format = "{ifname} via {gwaddr} 󰖟";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname} = {ipaddr}/{cidr}";
          on-click = "nm-applet";
        };
        "pulseaudio" = {
          #                 // "scroll-step" = 1; // %; can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
          #                 // "exec" = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
        };
        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
        #           "custom/radiation" = {
        #             "exec" = "/home/psyscic/pgrm/projects/rad/rad.sh";
        #             "interval" = 60;
        #             "format" = "{}  "
      }
    ];

    style = ''
              * {
                border: none;
                border-radius: 10px;
                font-family: "Iosevka Nerd Font" ;
                font-size: 18px;
                min-height: 10px;
              }

              window#waybar {
                background: transparent;
              }

              window#waybar.hidden {
                opacity: 0.2;
              }

      #window {
                margin-top: 6px;
                padding-left: 10px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                      color: #B5E8E0;
                background: transparent;
              }
      #workspaces {
                margin-top: 6px;
                margin-left: 12px;
                font-size: 4px;
                margin-bottom: 0px;
                border-radius: 10px;
                background: #161320;
                transition: none;
              }

      #workspaces button {
                transition: none;
                color: #B5E8E0;
                background: transparent;
                font-size: 16px;
                border-radius: 2px;
              }

      #workspaces button.occupied {
                transition: none;
                color: #F28FAD;
                background: transparent;
                font-size: 4px;
              }

      #workspaces button.active {
                color: #cfbdfb;
                      border-top: 2px solid #bdfbed;
                      border-bottom: 2px solid #bdfbed;
              }

      #workspaces button:hover {
                transition: none;
                box-shadow: inherit;
                text-shadow: inherit;
                color: #fbbdeb;
                border-color: #fbbdcc;
                color: #fbbdcc;
              }

      #workspaces button.active:hover {
                  color: #E8A2AF;
              }

      #network {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 18px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #f0bdfb;
              }

      #pulseaudio {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #1A1826;
                background: #FAE3B0;
              }

      #battery {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #B5E8E0;
              }

      #battery.charging, #battery.plugged {
                color: #161320;
                  background-color: #B5E8E0;
              }

      #battery.critical:not(.charging) {
                  background-color: #B5E8E0;
                  color: #161320;
                  animation-name: blink;
                  animation-duration: 0.5s;
                  animation-timing-function: linear;
                  animation-iteration-count: infinite;
                  animation-direction: alternate;
              }

              @keyframes blink {
                  to {
                      background-color: #BF616A;
                      color: #B5E8E0;
                  }
              }

      #backlight {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #F8BD96;
              }

      #clock {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #bdfbed;
                /*background: #1A1826;*/
              }

      #custom-radiation {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #f3fbbd;
              }

      #memory {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #DDB6F2;
              }

      #cpu {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #bdfbed;
              }

      #power-profiles-daemon {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #bdfbed;
              }

      #idle_inhibitor {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #bdfbed;
              }

      #temperature {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #bdfbed;
              }

      #tray {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                margin-bottom: 0px;
                padding-right: 10px;
                border-radius: 10px;
                transition: none;
                color: #B5E8E0;
                background: #252525;
              }

      #custom-launcher {
                font-size: 24px;
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 5px;
                border-radius: 10px;
                transition: none;
                  color: #89DCEB;
                  background: #161320;
              }

      #custom-power {
                font-size: 20px;
                margin-top: 6px;
                margin-left: 8px;
                margin-right: 8px;
                padding-left: 10px;
                padding-right: 5px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #F28FAD;
              }

      #custom-wallpaper {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #C9CBFF;
              }

      #custom-spotify {
                margin-top: 6px;
                margin-left: 8px;
                padding-left: 10px;
                padding-right: 10px;
                margin-bottom: 0px;
                border-radius: 10px;
                transition: none;
                color: #161320;
                background: #F2CDCD;
              }
    '';
  };
}
