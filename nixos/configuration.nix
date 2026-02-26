{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [

    ./hardware-configuration.nix
    ./system
    ../config/system

  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  users.users.zach = {
    isNormalUser = true;
    description = "Zach";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
    autoLogin = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
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

  # Remove
  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.xwayland.enable = true;

  #     Testing system versions unstable
  system.stateVersion = "26.05";
}
