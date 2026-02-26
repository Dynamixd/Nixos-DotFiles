{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{

  #Enable various services
  services.dbus.enable = true;
  services.openssh.enable = true;
  services.fstrim.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false;

}
