{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
    ./greetd.nix
    ./zsh.nix
    ./steam.nix
    ./wine.nix
  ];
}
