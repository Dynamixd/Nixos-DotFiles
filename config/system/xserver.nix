{
  pkgs,
  config,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "us";
    };
    libinput.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
