{
  inputs,
  config,
  pkgs,
  username,
  hostname,
  nixpkgs-stable,
  options,
  ...
}: {
  imports = [
    ./hardware.nix

    ./config/system
  ];

  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [
    "video=DP-1:2560x1440@143.97"
    "video=DP-2:2560x1440@100"
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 2456;
        to = 2458;
      }
      {
        from = 20545;
        to = 20546;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 2456;
        to = 2458;
      }
      {
        from = 20545;
        to = 20546;
      }
    ];
  };
  # Time and date settings
  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  console.keyMap = "us";

  users.users.zach = {
    isNormalUser = true;
    description = "Zach";
    extraGroups = ["networkmanager" "wheel" "openrazer"];
    packages = with pkgs; [
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services.dbus.enable = true;
  services.openssh.enable = true;
  services.fstrim.enable = true;
  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  #     Testing system versions unstable
  system.stateVersion = "25.05";
}
