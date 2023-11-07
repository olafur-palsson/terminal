#!/bin/bash

## Terminal

# Constants
var HISTTIMEFORMAT "%y-%m-%dT%T "

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

backlight() {
  local b=$(( $1 * 50 ))
  sudo sh -c "echo $b > /sys/class/backlight/intel_backlight/brightness"
}

math () {
  local expression="$@"
  awk "BEGIN { print $expression }"
}

portuse() {
  lsof -i ":$1"
}

alias search_files="grep -rnw . -e"

# Show disk usage of each folder in a folder
disk_use() {
  du -h --max-depth=1 | sort -rh
}

# foreach file in dir
foreach-file() {
  for file in .; do
    echo $@
  done
}

# Kill process by regex expression
killregex() {
  ps -Alf |grep -i $1 |grep -v grep |awk -F' ' '{print $4}' |xargs kill -9
}

killlist() {
  ps -Alf |grep -i $1 |grep -v grep|awk -F' ' '{print $15}' 
}

# Kills all processes that match $1, if $2 is provided, run $2 else run $1
refresh_process() {
  killregex $1
  if [ -z "$2" ]; then
    eval "$1"
  else
    eval "$2"
  fi
}

redo2() {
  local a=$(history | grep "^\s$1" | cut --delimiter=" " -f 5-)
  eval "$a"
}

redo() {
  banner "Pick command"
  local command=`history \
    | sort -rn \
    | sed -e "s/[0-9]\+  [0-9-]\+T[0-9:]\{8\} //g" \
    | uniq \
    | gum filter`
  # local command=`history \
  #   | 
  #   | uniq \
  #   | gum filter`
  if [ -z "$command" ]; then
    echo "No command"
  else
    echo "Executing $command"
    eval $command
  fi
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

alias formatjsonclipboard="clipboard | jq | clipboard"

# Search history of bash
alias searchhistory="history | grep"

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

unthrottle_wifi() {
  sudo wondershaper wlp0s20f3 clear
}

throttle_wifi() {
  local num=$1
  if [[ -z "$num" ]]
  then
    local num=1
  fi
  sudo wondershaper wlp0s20f3 $(( $num * 1024 )) $(( $num * 256))
}

