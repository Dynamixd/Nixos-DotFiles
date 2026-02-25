{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.bibata-cursors
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.gtk4
    pkgs.dracula-qt5-theme
    pkgs.dracula-theme
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      name = "jetbrains-mono";
      size = 12;
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.dracula-qt5-theme;
    };
  };
}
