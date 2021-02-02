# Show help docs
helpme() {
  pattern="$1"
  if [ -z "$1" ]; then
    pattern="."
  fi

  find $TERMINAL | grep bashrc | grep $pattern | xargs gawk -f $TERMINAL/scripts/docs.awk
}