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
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ../config/home
    #  nixvim.homeManagerModules.nixvim
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
  };

  config = {
    allowUnfree = true;
  };

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
