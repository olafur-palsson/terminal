#!/bin/bash

# TODO :
#   Make an 'install -s' function for apt that installs into a list of files to install after backup
#   Maybe make a package.json type of file to backup and extract from stuff.



# Load .bashrc here
import "$TERMINAL/init" # Very~/ generic .bashrc
import "$TERMINAL/console" # Tools for bash
import "$TERMINAL/devops" # Devops stuff
import "$TERMINAL/editor" # Devops stuff
import "$TERMINAL/apps/_index" # Devops stuff

## Current project shortcuts
alias velmodel="watch_do ./src '*pp' 'cmake . -DCMAKE_PREFIX_PATH=libtorch; make'"

## Variables

gen='~/.genericFiles/'
setup="$gen""setupscripts/"

var EDITOR nvim
var PYTHON_STARTUP "$HOME/.pythonrc"
var ANDROID_HOME /usr/lib/android-sdk
var GOOGLE_APPLICATION_CREDENTIALS /home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json
var GCLOUD_DEV_KEYFILE /home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json
var GCLOUD_PROD_KEYFILE /home/oli/Downloads/dexterdata-e5352-6ebca7986e93.json

path /home/pimp-of-pimps/anaconda/bin
path ~/java8/java8


## Couple of fun shortcuts

alias sobash=". ~/.bashrc"
alias sobashdev=". $TERMINAL/.bashrc"

alias help="awk -f ~/.genericFiles/getdocumentation.awk ~/*.bashrc > ~/README.md; cat ~/README.md"
alias helpv="help; view README.md"

alias seeya='systemctl hibernate'
alias bye='sudo shutdown now'

template() {
  xclip -sel c < ~/.code-templates/$1
}

