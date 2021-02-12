
export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad
alias l='ls -lAFh'
export EDITOR='nvim'

source /usr/local/etc/bash_completion.d/git-completion.bash

# Git status for prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null \
  | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1 /"
  #| sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Prompt
alias _userpwd='/usr/bin/perl -e '"'"'use Cwd;my $d=cwd();my $h=$ENV{"HOME"};my $dl=length($d);my $hl=length($h);if(($dl>=$hl)&&($h==substr($d,$hl))){print "~".substr($d,$hl,$dl);}else{print $d;}'"'"
export PS1="\[\e[33;1m\]\w\[\e[0;1;30m\] \[\e[34;1m\]\$(parse_git_branch)\[\e[36;1m\]\[\e[36;1m\]❯ \[\e[0m\]"
export PROMPT_COMMAND='echo -ne "\033]0;$(_userpwd)\007"'

export GOPATH=$HOME/go

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTSIZE=5000
HISTFILESIZE=10000

shopt -s histappend

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/barondas/.sdkman"
#[[ -s "/Users/barondas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/barondas/.sdkman/bin/sdkman-init.sh"

export ANDROID_HOME=$HOME/Library/Android/sdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "/Users/silasbaronda/.acme.sh/acme.sh.env"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source <(kubectl completion bash)
complete -F __start_kubectl k

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
