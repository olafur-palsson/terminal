#!/bin/bash

#### Tmux

# Attach to tmux session 'normal', handy for the tmux-resurrect megasession
alias t='tmux a -t "normal"'

## Tmuxinator

export TMUXINATOR_CONFIG="$TERMINAL_APPS/tmuxinator"

tmuxinator_app() {
  project=$1
  action=$2
  if [ -z "$action" ]; then
    tmuxinator stop $project && tmuxinator start $project
  else
    tmuxinator $action $project
  fi
}

tkillall() {
  tmux kill-server
}