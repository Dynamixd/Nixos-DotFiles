{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wineWow64Packages.staging
    wineWow64Packages.waylandFull
    winetricks
  ];
}
