{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #    (discord.override {
    #  withVencord = true;
    #})
    firefox
    heroic
    godot
    blender
    obsidian
    r2modman
    logiops
  ];
}
