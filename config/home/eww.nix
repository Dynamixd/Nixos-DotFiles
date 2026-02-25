{
  pkgs,
  lib,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = ./eww-config;
  };
}
