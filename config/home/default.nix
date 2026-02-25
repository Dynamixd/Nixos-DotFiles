{
  config,
  pkgs,
  ...
}: {
  imports = [
    #     ./bash.nix
    ./kitty.nix
    ./waybar.nix
    ./zsh.nix
    ./gtk-qt.nix
    ./hyprland.nix
    #      ./eww.nix
    ./hyprpanel.nix
    ./rofi.nix
    ./nixvim-config
    #      ./nixvim.nix
  ];
}
