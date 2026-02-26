{
  config,
  pkgs,
  ...
}: {
  environment.shells = [pkgs.bash pkgs.zsh];

  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false;

  users.defaultUserShell = pkgs.zsh;
}
