{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    config.enable = true;
    config.enableMan = false;

    config.mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin {inherit name src;};

    imports = [
      #  ./lib
      ./nixvim.nix
      ./autocmd.nix
      ./keymaps.nix
      ./plugins
    ];

    config.extraPackages = with pkgs; [
      ripgrep
      lazygit
      fzf
      fd
    ];
  };
}
