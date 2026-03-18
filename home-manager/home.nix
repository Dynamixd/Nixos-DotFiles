{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.dconf ];
  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "26.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./packages
    inputs.nixcord.homeModules.nixcord
    #  nixvim.homeManagerModules.nixvim
  ];

  #  Using Global Packages

  #  nixpkgs = {
  #  overlays = [
  #    inputs.self.overlays.additions
  #    inputs.self.overlays.modifications
  #    inputs.self.overlays.unstable-packages
  #  ];
  #  config = {
  #    allowUnfree = true;
  #  };
  #};

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
  #  programs.nixvim.enable = true;
}
