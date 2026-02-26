{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    zinit
    zsh-powerlevel10k
    fzf
    zoxide
  ];

  environment.shells = [
    pkgs.bash
    pkgs.zsh
  ];

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
  };
}
