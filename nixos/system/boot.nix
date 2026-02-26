{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{

  #Boot loader settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader.grub.enable = false;
  security.rtkit.enable = true;
  boot.kernelParams = [
    "video=DP-1:2560x1440@143.97"
    "video=DP-2:2560x1440@100"
    "usbcore.autosuspend=1"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

}
