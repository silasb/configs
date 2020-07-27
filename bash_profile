# for use with binstubs
export PATH=./bin:$HOME/.rbenv/shims:$PATH

export RBENV_SHELL=bash
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.bash'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

export PATH=$HOME/opt/bin:$HOME/opt/sbin:$HOME/bin:$HOME/LIbrary/Python/2.7/bin:$PATH

if [ -e "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR=~/.nvm

#eval $(docker-machine env default)

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore .gradle --ignore coverage --ignore log --ignore tags -g ""'

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
#export ANDROID_HOME=/usr/local/share/android-sdk

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/barondas/.sdkman"
[[ -s "/Users/barondas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/barondas/.sdkman/bin/sdkman-init.sh"

export PATH=$HOME/.cargo/bin:$HOME/go/bin:$PATH

# Android stuff
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PKG_CONFIG_PATH=/usr/local/opt/mysql@5.7/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

