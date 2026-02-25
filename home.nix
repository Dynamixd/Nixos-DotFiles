{
  config,
  pkgs,
  inputs,
  username,
  ...
}: {
  home.packages = [pkgs.dconf];
  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./config/home
    #  nixvim.homeManagerModules.nixvim
  ];

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.home-manager.enable = true;
  #  programs.nixvim.enable = true;
}
