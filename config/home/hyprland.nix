{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = with lib; {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = let
      modifier = "SUPER";
      modifier2 = "ALT";
    in
      concatStrings [
        ''

                  monitor = DP-1, 2560x1440@143.97, 0x0, 1
                  monitor = DP-2, 2560x1440@100, 2560x0, 1

                  $terminal = kitty
                  $fileManager = dolphin

                    exec-once = $terminal
                    exec-once = easyeffects --gapplication-service
                    exec-once = hyprpaper
          #          exec-once = waybar
          #          exec-once = eww daemon
          #          exec-once = sleep 1 && eww open bar

                  env = XCURSOR_SIZE,24
                  env = HYPRCURSOR_SIZE,24
                  env = NIXOS_OZONE_WL, 1
                  env = NIXPKGS_ALLOW_UNFREE, 1
                  env = XDG_CURRENT_DESKTOP, Hyprland
                  env = XDG_SESSION_TYPE, wayland
                  env = XDG_SESSION_DESKTOP, Hyprland
                  env = GDK_BACKEND, wayland
                  env = CLUTTER_BACKEND, wayland
                  env = SDL_VIDEODRIVER, wayland
                  env = QT_QPA_PLATFORM, wayland
                  env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
                  env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
                  env = MOZ_ENABLE_WAYLAND, 1
                  env = WLR_NO_HARDWARE_CURSORS, 1

                  general {
                      gaps_in = 6
                      gaps_out = 8

                      border_size = 2

                      col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
                      col.inactive_border = rgba(595959aa) 45deg

                      resize_on_border = true

                      allow_tearing = false

                      layout = dwindle
                  }

                  decoration {
                      rounding = 10

                      active_opacity = 1.0
                      inactive_opacity = 1.0

                      shadow {
                          enabled = true
                          range = 4
                          render_power = 3
                          color = rgba(1a1a1aee)
                      }

                      blur {
                          enabled = true
                          size = 5
                          passes = 3
                          new_optimizations = on
                          ignore_opacity = on
                      }
                  }


                  dwindle {
                      pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                      preserve_split = true # You probably want this
                  }

                  master {
                      new_status = master
                  }

                  misc {
                      force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
                      disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
                      mouse_move_enables_dpms = true
                      key_press_enables_dpms = true
                      focus_on_activate = true
                  }

                  input {
                      kb_layout = us
                      kb_variant =
                      kb_model =
                      kb_options =
                      kb_rules =

                      follow_mouse = 1

                      sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

                      touchpad {
                          natural_scroll = false
                      }
                  }

          #       gestures {
          #           workspace_swipe = false
          #       }

                  $mainMod = SUPER # Sets "Windows" key as main modifier

                  bind = $mainMod, T, exec, $terminal
                  bind = $mainMod, Q, killactive,
                  bind = ALT, F4, killactive,
          #bind = F10, fullscreen,
                  bind = $mainMod SHIFT, E, exit,
                  bind = $mainMod SHIFT, F, exec, $fileManager
                  bind = $mainMod, V, togglefloating,
                  bind = $mainMod, W, exec, pkill rofi || rofi -show drun
                  bind = $mainMod, P, pseudo, # dwindle
                  bind = $mainMod, J, togglesplit, # dwindle
                  bind = $mainMod, F, fullscreen
                  bind = $mainMod, D, exec, vesktop

          # Move focus with mainMod + arrow keys
                  bind = $mainMod, left, movefocus, l
                  bind = $mainMod, right, movefocus, r
                  bind = $mainMod, up, movefocus, u
                  bind = $mainMod, down, movefocus, d

          # Switch workspaces with mainMod + [0-9]
                  bind = $mainMod, 1, workspace, 1
                  bind = $mainMod, 2, workspace, 2
                  bind = $mainMod, 3, workspace, 3
                  bind = $mainMod, 4, workspace, 4
                  bind = $mainMod, 5, workspace, 5
                  bind = $mainMod, 6, workspace, 6
                  bind = $mainMod, 7, workspace, 7
                  bind = $mainMod, 8, workspace, 8
                  bind = $mainMod, 9, workspace, 9
                  bind = $mainMod, 0, workspace, 10

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
                  bind = $mainMod SHIFT, 1, movetoworkspace, 1
                  bind = $mainMod SHIFT, 2, movetoworkspace, 2
                  bind = $mainMod SHIFT, 3, movetoworkspace, 3
                  bind = $mainMod SHIFT, 4, movetoworkspace, 4
                  bind = $mainMod SHIFT, 5, movetoworkspace, 5
                  bind = $mainMod SHIFT, 6, movetoworkspace, 6
                  bind = $mainMod SHIFT, 7, movetoworkspace, 7
                  bind = $mainMod SHIFT, 8, movetoworkspace, 8
                  bind = $mainMod SHIFT, 9, movetoworkspace, 9
                  bind = $mainMod SHIFT, 0, movetoworkspace, 10


                  bind = $mainMod, mouse_down, workspace, e+1
                  bind = $mainMod, mouse_up, workspace, e-1

                  bindm = $mainMod, mouse:272, movewindow
                  bindm = $mainMod, mouse:273, resizewindow

                  bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
                  bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
                  bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
                  bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

                  bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

                  bindl = , XF86AudioNext, exec, playerctl next
                  bindl = , XF86AudioPause, exec, playerctl play-pause
                  bindl = , XF86AudioPlay, exec, playerctl play-pause
                  bindl = , XF86AudioPrev, exec, playerctl previous






          # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
          # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█


          # Example windowrule v1
          # windowrule = float on, ^<kitty>$
          # Example windowrule v2
          # windowrule = float on,match:class <kitty>$,title:^(kitty)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

          #windowrule = opacity 0.95 0.95,match:class <firefox>$
          #windowrule = opacity 0.90 0.90,match:class <Brave-browser>$
          #windowrule = opacity 0.80 0.80,match:class <Steam>$
          #      windowrule = opacity 0.80 0.80,match:class <steam>$
          #      windowrule = opacity 0.80 0.80,match:class <steamwebhelper>$
                  windowrule  = opacity 0.80 0.80,match:class <Spotify>
                  windowrule  = opacity 0.80 0.80,match:class <Code>
                  windowrule  = opacity 0.80 0.80,match:class <code-url-handler>
          #windowrule = opacity 0.80 0.80,match:class <kitty>
                  windowrule   = opacity 0.80 0.80,match:class <org.kde.dolphin>
                  windowrule   = opacity 0.80 0.80,match:class <org.kde.ark>
                  windowrule   = opacity 0.80 0.80,match:class <nwg-look>
                  windowrule   = opacity 0.80 0.80,match:class <qt5ct>

                  windowrule   = opacity 0.90 0.90,match:class <com.github.rafostar.Clapper>  #Clapper-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <com.github.tchx84.Flatseal>  #Flatseal-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <hu.kramo.Cartridges>  #Cartridges-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <com.obsproject.Studio>  #Obs-Qt
                  windowrule   = opacity 0.80 0.80,match:class <gnome-boxes>  #Boxes-Gtk
          #      windowrulev  = opacity 0.80 0.80,match:class <discord>  #Discord-Electron
                  windowrule   = opacity 0.80 0.80,match:class <app.drey.Warp>  #Warp-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <net.davidotek.pupgui2>  #ProtonUp-Qt
                  windowrule   = opacity 0.80 0.80,match:class <yad>  #Protontricks-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <Signal>  #Signal-Gtk
                  windowrule   = opacity 0.80 0.80,match:class <io.gitlab.theevilskeleton.Upscaler>  #Upscaler-Gtk

          #windowrule = opacity 0.80 0.70,match:class <org.pulseaudio.pavucontrol>
                  windowrule   = opacity 0.80 0.70,match:class <blueman-manager>
          #windowrule = opacity 0.80 0.70,match:class <nm-applet>
          #windowrule = opacity 0.80 0.70,match:class <nm-connection-editor>
                  windowrule   = opacity 0.80 0.70,match:class <org.kde.polkit-kde-authentication-agent-1>

                  windowrule   = tile on,match:class <Godot>

                  windowrule   = float on,match:class <qt5ct>
                  windowrule   = float on,match:class <nwg-look>
                  windowrule   = float on,match:class <org.kde.ark>
                  windowrule   = float on,match:class <Signal>  #Signal-Gtk
                  windowrule   = float on,match:class <com.github.rafostar.Clapper>  #Clapper-Gtk
                  windowrule   = float on,match:class <app.drey.Warp>  #Warp-Gtk
                  windowrule   = float on,match:class <net.davidotek.pupgui2>  #ProtonUp-Qt
                  windowrule   = float on,match:class <yad>  #Protontricks-Gtk
                  windowrule   = float on,match:class <eog>  #Imageviewer-Gtk<BS>
                  windowrule   = float on,match:class <io.gitlab.theevilskeleton.Upscaler>  #Upscaler-Gtk
                  windowrule   = float on,match:class <org.pulseaudio.pavucontrol>
                  windowrule   = float on,match:class <blueman-manager>
                  windowrule   = float on,match:class <nm-applet>
                  windowrule   = float on,match:class <nm-connection-editor>
                  windowrule   = float on,match:class <org.kde.polkit-kde-authentication-agent-1>

        ''
      ];
  };
}
