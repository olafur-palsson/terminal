#!/bin/bash

# Terminal
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Kill process by regex expression
killregex() {
  ps -Alf |grep -i $1 |grep -v grep |awk -F' ' '{print $4}' |xargs kill -9
}

# Update and upgrade all
alias update='pkcon update -y'

# Sedpipe with less writing, use like 'ls * | sedpp replaceThis withThis'
sedpp() {
	xargs sed -i 's/'$1'/'$2'/g'
}

# Use sed with the pipe like this 'ls * | sedpipe "s/replaceThis/withThis/"' or some other s command
alias sedpipe="xargs sed -i "$1

# Display all 256 terminal colors
showcolors() {
  for color in {0..255}; do
    printf "\e[38;5;%sm %s \n" $color $color
  done
}

killregex() {
  ps -Alf |grep -i $1 |grep -v grep |awk -F' ' '{print $4}' |xargs kill -9
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