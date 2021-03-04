#!/bin/bash

# TODO :
#   Make an 'install -s' function for apt that installs into a list of files to install after backup
#   Maybe make a package.json type of file to backup and extract from stuff.



# Load .bashrc here
import "$TERMINAL/init"
import "$TERMINAL/os"
import "$TERMINAL/devops"
import "$TERMINAL/editor"
import "$TERMINAL/languages"
import "$TERMINAL/apps/_index"
import "$TERMINAL/projects/_index"

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

alias seeya='systemctl hibernate'
alias bye='sudo shutdown now'

template() {
  xclip -sel c < ~/.code-templates/$1
}

cool_string() {
  echo "$1 is cool"
}

very_cool_string() {
  echo "$(cool_string Oli), very cool in fact."
}

date_strings() {
  date_arg="next Fri"
  echo 'date --date="$date_arg"'
  echo "date --date='$date_arg'"
  echo `date --date="$date_arg"`
  echo $(date --date="$date_arg")
}

conditionals() {
  echo First
  [ "this is what?" ] && echo "true" || echo "false"
}

print_args() {
  echo $0
  echo $1
  echo $2
}

using_eval() {
  str="very_cool_string"
  lol= $(eval $str)
}

variable_test() {
  foo="something"
  bar
}

bar() {
  echo $foo
}

baz() {
  echo $foo
}