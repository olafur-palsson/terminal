#!/bin/bash

## This is what should be stored as your root .bashrc

import() {
  suffix='.bashrc'
  [ -z "$2" ] && suffix='.bashrc' || suffix=""
  file_name="$1$suffix"
  if [ -f $file_name ]; then
    # if [ -z "$TERMDEBUG" ]; then
    #   echo $file_name
    # fi
    . $file_name
  else
    echo "ImportError: $file_name"
    echo "If this is not the file you wanted, try 'import_verbatim'"
  fi
}

import_verbatim() {
  import $1 --override
}

var() {
  eval "export $1=\"$2\""
}

path() {
  eval var PATH "$PATH:$1"
}

export TERMINAL="$HOME/projects/terminal"
export TERMINAL_ROOT="$TERMINAL/_root.bashrc"

if [ -f "$TERMINAL_ROOT" ]; then
  . $TERMINAL_ROOT
fi

