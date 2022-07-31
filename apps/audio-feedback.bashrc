pass () {
  python "$TERMINAL/scripts/pass_fail_sound.py"
}

fail () {
  python "$TERMINAL/scripts/pass_fail_sound.py" -f
}
