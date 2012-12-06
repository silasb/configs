export PATH=$HOME/opt/bin:$HOME/opt/sbin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/bin:$PATH
eval "$(rbenv init -)"

if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

if [ -e "$HOME/.bashrc" ]; then
  . $HOME/.bashrc
fi
