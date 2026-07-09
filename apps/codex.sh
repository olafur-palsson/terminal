alias cx='codex -s workspace-write --ask-for-approval on-request'
alias todo="cl 'Do the next item on the TODO.md'"

ralph() {
  local n=1

  if [[ "$1" == "-n" ]]; then
    n="$2"
    shift 2
  fi

  local prompt="$*"

  for ((i=1; i<=n; i++)); do
    echo "=== Ralph iteration $i/$n ==="
    cl -p "$prompt" || break
  done
}
