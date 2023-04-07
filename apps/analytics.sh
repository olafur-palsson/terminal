#!/bin/bash

pipe_file_has_line_with() {
  expression=$1
  file=$2
  if [ $(cat $0 | grep -c $1) ]; then
    echo $file
  fi
}

checkfiles() {
  folder=$1
  regex=$2
  string_to_find=$3
  COUNTER=0
  ((COUNTER++))
  count2=0
  find $folder | grep -e $regex | while read -r line
  do
    if cat $line | grep -e $string_to_find
    then
      COUNTER=$[$COUNTER +1]
      echo $line
      cat -n $line | grep -e $string_to_find | echo
    fi
  done
  echo $COUNTER number of files
}