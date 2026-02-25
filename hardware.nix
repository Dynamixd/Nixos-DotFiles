{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelParams = ["usbcore.autosuspend=-1"];
  boot.supportedFilesystems = ["ntfs"];

  services.printing.enable = true;

  boot.loader.grub.enable = false;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  programs.xwayland.enable = true;

  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.iosevka
    texlivePackages.fontawesome
    terminus_font_ttf
    corefonts
    vista-fonts
  ];

  fileSystems."/Shared" = {
    device = "/dev/disk/by-uuid/2947B9D34DB7DF90";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000"];
  };
}
