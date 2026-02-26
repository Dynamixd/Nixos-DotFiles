{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./services.nix
    ./boot.nix
    ./hardware.nix
    ./fonts.nix
    ./networking.nix
    ./locale.nix
  ];
}
