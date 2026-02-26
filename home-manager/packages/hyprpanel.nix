{inputs, ...}: {
  programs.hyprpanel = {
    enable = true;
    # Configure and theme almost all options from the GUI.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      # Configure bar layouts for monitors.
      # See 'https://hyprpanel.com/configuration/panel.html'.
      # Default: null
      bar.layouts = {
        "*" = {
          left = ["dashboard" "workspaces"];
          middle = ["media"];
          right = ["systray" "clock" "volume" "notifications"];
        };
      };

      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.clock.format = "%d %I:%M";

      #      menus.clock = {
      #        time = {
      #          military = false;
      #          hideSeconds = true;
      #        };
      #        weather.unit = "metric";
      #      };

      menus.dashboard.directories.enabled = true;

      theme.bar.transparent = false;

      theme.font = {
        name = "CaskaydiaCove NF";
        size = "16px";
      };
    };
  };
}
