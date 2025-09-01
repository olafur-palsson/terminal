#!/bin/bash

#### Languages

## Python

alias pip="pip3"
alias python="python3"


alias upgradepip3="pip3 list --outdated | cut -d ' ' -f1 | tail -n +3 | xargs pip3 install --upgrade"
alias upgradepip2="pip list --outdated | cut -d ' ' -f1 | tail -n +3 | xargs pip install --upgrade"

# Upgrade pip, use upgradepip2 or upgradepip3 to only upgrade those
upgradepip() {
	upgradepip3
	upgradepip2
}

# Simple alias for 'jupyter notebook'
alias pybook="jupyter notebook"

python_unittest_runner() {
    watch_do . '.*py' 'clear && python -m unittest' true
}

## C++

# Creates a new cpp file with an acompanying header file as .cpp and .hpp
newcpp() {
  cppPath=$HOME"/.genericFiles/c++tools/"
  headerboiler=$cppPath"header.hpp"
  baseboiler=$cppPath"base.cpp"
}

compilecpp() {
  name=$1
  caps=$(echo $name | awk '{ print toupper($0) }')
  cat $baseboiler | sed "s/filename/$name/g" > $name.cpp
  cat $headerboiler | sed "s/filename/$name/g" | sed "s/capsname/$caps/g" > $name.hpp
}

# compile with output file as 'filename.o' with std=c++17
gppp() {
  filename=$(echo $1 | cut -d'.' -f 1)
  g++ -o $filename'.o' $1 -std=c++14
  unset $filename
}


# watch folder $1 for anything that matches $2 then on close_write do $3
autocompilecpp() {
  regex="(cpp|hpp)$";
  inotifywait -m "." -e close_write |
    while read path action file; do
      filetocompile=$(echo "$file" | sed 's/hpp$/cpp/')
      echo "$file" | grep -Eq "$regex" \
        && tput reset \
        && $(g++ "$filetocompile" -c $(echo $filetocompile | sed 's/cpp/o/')) \
        && echo "$filetocompile compiled."
    done
}
