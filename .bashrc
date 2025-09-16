#!/bin/bash

# ... set these to whereever
export TERMINAL="$HOME/projects/terminal"
export TERMINAL_ROOT="$TERMINAL/_index.bashrc"
export GNU_P_DIR="$HOME/passwords"

if [ -f "$TERMINAL_ROOT" ]; then
  . $TERMINAL_ROOT
else
  echo "Couldn't import root script"
fi
