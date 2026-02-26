{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [

    ./hardware-configuration.nix
    ../config/system

  ];

  nixpkgs = {

    #overlays = [
    #inputs.self.overlays.additions
    #inputs.self.overlays.modifications
    #inputs.self.overlays.unstable-packages
    #    ];

    config.allowUnfree = true;

  };
  users.users.zach = {
    isNormalUser = true;
    description = "Zach";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services.dbus.enable = true;
  services.openssh.enable = true;
  services.fstrim.enable = true;
  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.supportedFilesystems = [ "ntfs" ];

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
    options = [
      "rw"
      "uid=1000"
    ];
  };

  boot.kernelParams = [
    "video=DP-1:2560x1440@143.97"
    "video=DP-2:2560x1440@100"
    "usbcore.autosuspend=1"
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
  # Time and date settings
  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  console.keyMap = "us";

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  #     Testing system versions unstable
  system.stateVersion = "26.05";
}
