export PATH=$HOME/opt/bin:$HOME/opt/sbin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:$HOME/LIbrary/Python/2.7/bin:$PATH
eval "$(rbenv init -)"

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

if [ -e "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#eval $(docker-machine env default)

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore .gradle --ignore coverage -g ""'

