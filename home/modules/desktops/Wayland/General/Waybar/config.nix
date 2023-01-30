{
  mainBar = {
    "layer" = "top"; # Waybar at top layer
    "position" = "top"; # top|left|bottom|right
    #"height" = 30, # Waybar height (to be removed for auto height)
    # "width" = 1280, # Waybar width
    #"spacing" = 4, # Gaps between modules (4px)
    # Choose the order of the modules

    "modules-left" = [ "wlr/workspaces" "hyprland/window" ];
    "modules-center" = [ ];
    "modules-right" = [
      "pulseaudio"
      "network"
      #"cpu"
      #"memory"
      "temperature"
      "keyboard-state"
      "battery"
      "clock"
      "tray"
    ];
    # Modules configuration
    "wlr/workspaces" = {
      "format" = "{icon}";
      "on-scroll-up" = "hyprctl dispatch workspace e+1";
      "on-scroll-down" = "hyprctl dispatch workspace e-1";
      "format-icons" = {
        "1" = "1";
        "2" = "2";
        "3" = "3";
      };
    };
    # "sway/workspaces" = {
    #     "disable-scroll" = true;
    #     "all-outputs" = true;
    #     "format" = "{name} = {icon}";
    #     "format-icons" = {
    #         "1" = "";
    #         "2" = "";
    #         "3" = "";
    #         "4" = "";
    #         "5" = "";
    #         "urgent" = "";
    #         "focused" = "";
    #         "default" = ""
    #     }
    # };
    "keyboard-state" = {
      "numlock" = true;
      "capslock" = true;
      "format" = "{icon} {name}";
      "format-icons" = {
        "locked" = "";
        "unlocked" = "";
      };
    };
    "hyprland/window" = {
      "format" = "➡ {}";
      "separate-outputs" = true;
    };
    "mpd" = {
      "format" = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime =%M =%S}/{totalTime =%M =%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
      "format-disconnected" = "Disconnected ";
      "format-stopped" = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
      "unknown-tag" = "N/A";
      "interval" = 2;
      "consume-icons" = {
        "on" = " ";
      };
      "random-icons" = {
        "off" = "<span color=\"#f53c3c\"></span> ";
        "on" = " ";
      };
      "repeat-icons" = {
        "on" = " ";
      };
      "single-icons" = {
        "on" = "1 ";
      };
      "state-icons" = {
        "paused" = "";
        "playing" = "";
      };
      "tooltip-format" = "MPD (connected)";
      "tooltip-format-disconnected" = "MPD (disconnected)";
    };
    "idle_inhibitor" = {
      "format" = "{icon}";
      "format-icons" = {
        "activated" = "";
        "deactivated" = "";
      };
    };
    "tray" = {
      # "icon-size" = 21;
      "spacing" = 10;
    };
    "clock" = {
      # "timezone" = "America/New_York";
      "tooltip-format" = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      "format-alt" = "{ =%Y-%m-%d}";
    };
    "cpu" = {
      "format" = " {usage}%";
      "tooltip" = false;
    };
    "memory" = {
      "format" = "{}% ";
    };
    "temperature" = {
      # "thermal-zone" = 2;
      # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
      "critical-threshold" = 80;
      # "format-critical" = "{temperatureC}°C {icon}";
      "format" = "{icon} {temperatureC}°C";
      "format-icons" = [ "" "" "" ];
    };
    "backlight" = {
      # "device" = "acpi_video1";
      "format" = "{percent}% {icon}";
      "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
    };
    "battery" = {
      "states" = {
        # "good" = 95;
        "warning" = 30;
        "critical" = 15;
      };
      "format" = "{capacity}% {icon}";
      "format-charging" = "{capacity}% ";
      "format-plugged" = "{capacity}% 🗲";
      "format-alt" = ''{time} {icon}'';
      # "format-good" = ""; # An empty format will hide the module
      # "format-full" = "";
      "format-icons" = [ "" "" "" "" "" ];
    };
    "battery#bat2" = {
      "bat" = "BAT2";
    };
    "network" = {
      # "interface" = "wlp2*", # (Optional) To force the use of this interface
      "format-wifi" = " {essid} ({signalStrength}%)";
      "format-ethernet" = " {ipaddr}/{cidr}";
      "tooltip-format" = " {ifname} via {gwaddr}";
      "format-linked" = " {ifname} (No IP)";
      "format-disconnected" = "⚠ Disconnected";
      "format-alt" = "{ifname} = {ipaddr}/{cidr}";
    };
    "pulseaudio" = {
      # "scroll-step" = 1, # %, can be a float
      "format" = "{icon}  {volume}%   {format_source}";
      "format-bluetooth" = "{volume}% {icon} {format_source}";
      "format-bluetooth-muted" = " {icon} {format_source}";
      "format-muted" = " {format_source}";
      "format-source" = " {volume}%";
      "format-source-muted" = "";
      "format-icons" = {
        "headphone" = "";
        "hands-free" = "";
        "headset" = "";
        "phone" = "";
        "portable" = "";
        "car" = "";
        "default" = [ "" "" "" ];
      };
      "on-click" = "pavucontrol";
    };
    "custom/media" = {
      "format" = "{icon} {}";
      "return-type" = "json";
      "max-length" = 40;
      "format-icons" = {
        "spotify" = "";
        "default" = "🎜";
      };
      "escape" = true;
      "exec" = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # Script in resources folder
      # "exec" = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" # Filter player based on name
    };
  };
}
