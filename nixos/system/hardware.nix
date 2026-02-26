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
  fileSystems."/Shared" = {
    device = "/dev/disk/by-uuid/2947B9D34DB7DF90";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };
}
