
webapp() {
  local root="$1"
  local webapproot="$2"
  shift 2
  cd "$root"
  if [ ! -z "$1" ]; then
    cd "$webapproot"
    echo "npm ${@: 1}"
    eval "npm ${@: 1}"
  fi
}

