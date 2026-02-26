{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 2456;
        to = 2458;
      }
      {
        from = 20545;
        to = 20546;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 2456;
        to = 2458;
      }
      {
        from = 20545;
        to = 20546;
      }
    ];
  };
}
