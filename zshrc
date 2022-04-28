# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if command "rbenv" &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi
source ~/repos/configs/zshrc-user

# for use with binstubs
export PATH=./bin:$PATH

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=/opt/homebrew/opt/mysql@5.7/bin:/opt/homebrew/bin:/Users/silas/.nvm/versions/node/v14.18.2/bin:/usr/local/homebrew/bin:/usr/local/homebrew/sbin:$PATH

bindkey -e

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore .gradle --ignore coverage --ignore log --ignore tags -g ""'

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir
source ~/powerlevel10k/powerlevel10k.zsh-theme

if command "zoxide" &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

if command "pyenv" &> /dev/null; then
  eval "$(pyenv init -)"
fi
