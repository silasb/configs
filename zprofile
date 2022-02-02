if [[ `uname -m` == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/homebrew/bin/brew shellenv)"
fi
