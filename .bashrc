#!/bin/bash

# ... set these to whereever
export TERMINAL="$HOME/projects/terminal"
export TERMINAL_ROOT="$TERMINAL/_index.bashrc"

if [ -f "$TERMINAL_ROOT" ]; then
  . $TERMINAL_ROOT
else
  echo "Couldn't import root script"
fi
