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


## C++

newcpp() {
  # Creates a new cpp file with an acompanying header file as .cpp and .hpp
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

gppp() {
  # compile with output file as 'filename.o' with std=c++17
  filename=$(echo $1 | cut -d'.' -f 1)
  g++ -o $filename'.o' $1 -std=c++14
  unset $filename
}