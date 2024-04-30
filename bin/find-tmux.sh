#!/usr/bin/env bash

path=$(fd . ~/repos/ -t d -a -d 1| fzf)

if [ -z "${path}" ]; then
  echo "Nothing to open"
  exit 1
fi

sessionName=$(basename $path)

if [ -z "${TMUX}" ]; then
  echo "here"
  tmux new -A -s $sessionName -c $path
else
  tmux switch -t $sessionName
fi

