{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  #Enable various hardware settings
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
}
