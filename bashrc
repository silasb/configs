
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
export PS1="\[\e[32;1m\]\u \[\e[33;1m\]\w\[\e[0;1;30m\] \[\e[34;1m\]\$(parse_git_branch)\[\e[36;1m\]\[\e[36;1m\]❯ \[\e[0m\]"
export PROMPT_COMMAND='echo -ne "\033]0;$(_userpwd)\007"'

export GOPATH=$HOME/go

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
