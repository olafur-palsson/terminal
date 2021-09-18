#!/bin/bash

# TODO :
#   Make an 'install -s' function for apt that installs into a list of files to install after backup
#   Maybe make a package.json type of file to backup and extract from stuff.


## Import file with 'import "$TERMINAL/path" to import "path.bashrc"'
import() {
  suffix='.bashrc'
  file_name="$1$suffix"
  if [ -f $file_name ]
  then
    . $file_name
  else
    if [ -f $1 ]
    then
      . $1
    else
      echo "ImportError: $file_name"
    fi
  fi
}

## Import override skipping .bashrc ending
import_verbatim() {
  import $1 --override
}


## Set environment variables
var() {
  eval "export $1=\"$2\""
}

## Add to path
path() {
  eval var PATH "$PATH:$1"
}


# Load .bashrc here
import "$TERMINAL/init"
import "$TERMINAL/os"
import "$TERMINAL/languages"

# Load bash apps and project specific bash
import "$TERMINAL/apps/_index"
import "$TERMINAL/projects/_index"

var EDITOR nvim
var PYTHON_STARTUP "$HOME/.pythonrc"
var ANDROID_HOME /usr/lib/android-sdk

## Source bash
alias sobash=". ~/.bashrc"

## Hibernate
alias seeya='systemctl hibernate'

## Shut down
alias bye='sudo shutdown now'

template() {
  xclip -sel c < ~/.code-templates/$1
}

