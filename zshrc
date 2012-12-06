autoload -U compinit
compinit

setopt auto_cd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export EDITOR=vim

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

setopt prompt_subst

setopt histignoredups

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

tcsh-backward-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-word
}
zle -N tcsh-backward-word

bindkey -e

bindkey '^U' backward-kill-line
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

export PATH=/Users/emerge/.gem/ruby/1.8/bin:$HOME/bin:$HOME/opt/bin:$HOME/.cabal/bin:$PATH

source $HOME/.aliases

alias tmux="TERM=screen-256color-bce tmux"

source ~/perl5/perlbrew/etc/bashrc

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOBIN:$PATH
export GOOS=darwin
export GOARCH=amd64

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
