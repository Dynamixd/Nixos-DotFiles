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
    ./packages

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

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  #     Testing system versions unstable
  system.stateVersion = "26.05";
}
