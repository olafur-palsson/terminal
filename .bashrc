#!/bin/bash

## This is what should be stored as your root .bashrc

import() {
  suffix='.bashrc'
  file_name="$1$suffix"
  if [ -f $file_name ]
  then
    . $file_name
  else
    echo "ImportError: $file_name"
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

switch_case_looks_like_this () {
  case $1 in
    cat)      echo evil
    ;; wolf)  echo mammal
    ;; duck)  echo bird
    ;; shark) echo fish
    ;; *)     echo I have no idea what a $1 is
  esac
}

var TERMINAL $HOME/projects/terminal
var TERMINAL_ROOT $TERMINAL/_root.bashrc

if [ -f "$TERMINAL_ROOT" ]; then
  . $TERMINAL_ROOT
fi

