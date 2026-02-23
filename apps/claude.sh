alias cl="claude --allowedTools fs.read,fs.write,fs.list --permission-mode acceptEdits"

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
