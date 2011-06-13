autoload -U compinit
compinit

setopt auto_cd

export EDITOR=vim

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

setopt prompt_subst

setopt histignoredups

export HISTSIZE=200

tcsh-backward-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-word
}
zle -N tcsh-backward-word

bindkey -e

bindkey '^[[5C' emacs-forward-word
bindkey '^[[5D' emacs-backward-word
bindkey '^[[3~' delete-char

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

_git_remote_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    if (( CURRENT == 2 )); then
      # first arg: operation
      compadd create publish rename delete track
    elif (( CURRENT == 3 )); then
      # second arg: remote branch name
      compadd `git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g"`
    elif (( CURRENT == 4 )); then
      # third arg: remote name
      compadd `git remote`
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb

export PATH=$HOME/bin:$PATH:$HOME/opt/bin

source $HOME/.aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
