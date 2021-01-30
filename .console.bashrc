#!/bin/bash

# Terminal
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Kill process by regex expression
killregex() {
  ps -Alf |grep -i $1 |grep -v grep |awk -F' ' '{print $4}' |xargs kill -9
}

# Reload Bash Source
alias sobash="source ~/.bashrc"

# Get help documentation and uploads it to readme
alias help="awk -f ~/.genericFiles/getdocumentation.awk ~/*.bashrc > ~/README.md; cat ~/README.md"

# Hibernate
alias seeya='systemctl hibernate'

# Shutdown
alias bye='sudo shutdown now'

# Update and upgrade all
alias update='sudo apt-get update; sudo apt-get upgrade -y'

# Sedpipe with less writing, use like 'ls * | sedpp replaceThis withThis'
sedpp() {
	xargs sed -i 's/'$1'/'$2'/g'
}

# Use sed with the pipe like this 'ls * | sedpipe "s/replaceThis/withThis/"' or some other s command
alias sedpipe="xargs sed -i "$1

showcolors() {
# Display all 256 terminal colors
  for color in {0..255}; do
    printf "\e[38;5;%sm %s \n" $color $color
  done
}


# Probably the best bash function I have made
watch_do() {
  # Very useful. Syntax true if recursive:  watch_do src '*.js' 'npm run build' [true]
  regex="$2";
  cmd="$3";
  recursive="$4"
  rec=""
  text=""
  [[ $recursive = "true" ]] && rec="r"
  [[ $recursive = "true" ]] && text="recursively"

  echo "Executing          $cmd "
  echo "For all that match $regex "
  echo "In                 $1 "
  echo "$text.";
  echo ""
  inotifywait -m"$rec"  "$1" -e close_write |
    while read path action file; do
      echo "$file" | grep -Eq "$regex" && eval "$cmd"
    done
}

# GPG error: https://apt.dockerproject.org/repo ubuntu-xenial InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F76221572C52609D
alias addkey="sudo apt-key adv --keyserver pgp.mit.edu --recv-keys"
# and then something like F76221572C52609D to solve 'NO_PUBKEY ...' Error during apt-get update

filter_file() {
  while [ $# -gt 0 ]; do
    if [ $(cat $0 | grep -c) ]; then
      echo $0
    fi
  done

  while read string; do
    grep -Fxv "$string" $list
  done
}
