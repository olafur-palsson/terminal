
pass_sound () {
  line=$(head -n 1 /tmp/AUDIO_FEEDBACK_STATUS)
  if [ "$line" != "PASS" ]; then
    ffplay -nodisp -autoexit "$TERMINAL/scripts/pass.mp3" >/dev/null 2>&1
  fi
  echo "PASS" > /tmp/AUDIO_FEEDBACK_STATUS
  export AUDIO_FEEDBACK_STATUS="PASS"
}

fail () {
  line=$(head -n 1 /tmp/AUDIO_FEEDBACK_STATUS)
  if [ "$line" != "FAIL" ]; then
    ffplay -nodisp -autoexit "$TERMINAL/scripts/fail.mp3" >/dev/null 2>&1
  fi
  echo "FAIL" > /tmp/AUDIO_FEEDBACK_STATUS
  export AUDIO_FEEDBACK_STATUS="FAIL"
}
