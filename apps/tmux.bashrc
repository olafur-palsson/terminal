#!/bin/bash

var TMUXINATOR_CONFIG $TERMINAL_APPS/tmuxinator

#### Tmux

# Attach to tmux session 'normal', handy for the tmux-resurrect megasession
alias t='tmux a -t "normal"'

# Kill all tmux instances
tkillall() {
  tmux kill-server
}

## Tmuxinator

# Shorthand for tmuxinator $2 $1, default to restarting
proj() {
  project=$1
  action=$2
  if [ -z "$action" ]; then
    tmuxinator stop $project && tmuxinator start $project
  else
    tmuxinator $action $project
  fi
}
