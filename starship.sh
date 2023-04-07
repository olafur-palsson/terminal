eval "$(starship init bash)"
export STARSHIP_CONFIG="$TERMINAL/resources/starship.toml"
stars() {
  nvim "$STARSHIP_CONFIG"
}
