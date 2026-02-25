{
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.permittedInsecurePackages = [ "libsoup-2.74.3" ];
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
    easyeffects
    jdk21
    kdePackages.dolphin
    waybar
    hyprpaper
    kitty
    rofi
    git
    gcc
    gnumake
    pkg-config
    nodejs_22
    python3
    unzip
    ripgrep
    wayclip
    pavucontrol
    networkmanager
    eww
    heroic
    godot
    blender
    krita
    gh
    obsidian
    #      aylurs-gtk-shell-git
    wireplumber
    libgtop
    bluez
    bluez-tools
    dart-sass
    wl-clipboard
    upower
    gvfs
    gtksourceview3
    libsoup_3
    gtk2-x11
    gtk2
    logiops
    vesktop
    r2modman
    killall
    gupnp
    upnp-router-control
    gamescope
    p7zip
    protontricks
    #     qt5.full
    #     kdePackages.waylib
    kdePackages.wayland-protocols
    kdePackages.syntax-highlighting
    kdePackages.sonnet
    kdePackages.qxlsx
    kdePackages.qwt
    kdePackages.qwlroots
    kdePackages.quazip
    kdePackages.qtwebview
    kdePackages.qtwebsockets
    kdePackages.qtwayland
    kdePackages.qtwebengine
    kdePackages.qtwebchannel
    kdePackages.qtutilities
    kdePackages.qttools
    #     kdePackages.qttranslations
    #     kdePackages.qtsvg
    #     kdePackages.qtspell
    #     kdePackages.qtspeech
    #     kdePackages.qtshadertools
    #     kdePackages.qtserialport
    #     kdepackages.qtserialbus
    #      kdePackages.qtsensors
    #      kdePackages.qtscxml
    kdePackages.qt6gtk2
    kdePackages.qt6ct
    kdePackages.qt5compat
    qtcreator
    curl
    zenity
    jq
    opentrack
    fd
    lazygit
    wget
    alejandra
  ];
}
