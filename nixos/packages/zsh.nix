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
    enableGlobalCompInit = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = with lib.mkBefore; ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi


      source ${pkgs.zinit}/share/zinit/zinit.zsh

      ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"

      zinit ice depth=1; zinit light romkatv/powerlevel10k

      zinit light zsh-users/zsh-autosuggestions
      zinit light zsh-users/zsh-completions
      zinit light aloxaf/fzf-tab

      zinit snippet OMZL::git.zsh
      zinit snippet OMZP::git
      zinit snippet OMZP::sudo
      zinit snippet OMZP::archlinux
      zinit snippet OMZP::aws
      zinit snippet OMZP::kubectl
      zinit snippet OMZP::kubectx
      zinit snippet OMZP::command-not-found

      autoload -Uz compinit && compinit

      zinit cdreplay -q


      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region

      HISTSIZE=5000
      HISTFILE=~/.zsh_history
      SAVEHIST=$HISTSIZE
      HISTDUP=erase
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      alias ls='ls --color'
      alias vim='nvim'
      alias c='clear'

      eval "''$(fzf --zsh)"
      eval "''$(zoxide init --cmd cd zsh)"
    '';

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
  };
}
