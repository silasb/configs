# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# fi
source ~/repos/configs/zshrc-user

# for use with binstubs
export PATH=./bin:$PATH

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# typical linux terminal
#export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

bindkey -e


export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore .gradle --ignore coverage --ignore log --ignore tags -g ""'
export FZF_DEFAULT_OPTS='-i'

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir
source ~/powerlevel10k/powerlevel10k.zsh-theme

#if command "zoxide" &> /dev/null; then
  eval "$(zoxide init zsh)"
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

if command "pyenv" &> /dev/null; then
  eval "$(pyenv init -)"
fi
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

bindkey -s '^o' 'nvim $(fzf)^M'
bindkey -s '^f' '~/bin/find-tmux.sh^M'

#function z () {
  #result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")"
  #sessionName=$(basename $result)
  #tmux new -A -s $sessionName -c $result
#}

#z () {
  #export _ZO_ECHO=1
  #__zoxide_z "$@"
#}



source ~/.beam-cli/alias

#. /opt/homebrew/opt/asdf/libexec/asdf.sh
#source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# pnpm
export PNPM_HOME="/Users/silas/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# FIXME: remove with manually migration
# eval "$(~/bin/rtx activate zsh)"

jwt-decode() {
  jq -R 'split(".") |.[0:2] | map(@base64d) | map(fromjson)' <<< $1
}

eval "$(mise activate zsh)"
