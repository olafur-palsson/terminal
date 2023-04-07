# Show help docs
helpme() {
  pattern="$1"
  if [ -z "$1" ]; then
    cat $TERMINAL/header.md > readme.md
    find $TERMINAL | grep bashrc | xargs gawk -f $TERMINAL/scripts/docs.awk >> $TERMINAL/readme.md
    cat $TERMINAL/readme.md
  else
    find $TERMINAL | grep bashrc | grep $pattern | xargs gawk -f $TERMINAL/scripts/docs.awk >> $TERMINAL/readme.md
  fi

}