#!/bin/bash

alias guitar-app="tmuxinator_app 'guitar-app'"

var GUITAR_APP "$HOME/projects/guitar-app/front"
var GUITAR_APP_UNSIGNED "$GUITAR_APP/dist/cordova/android/apk/release/app-release-unsigned.apk"

var GUITAR_APP_ALIGNED "$GUITAR_APP/aligned.apk"
var GUITAR_APP_SIGNED "$GUITAR_APP/signed.apk"
var GUITAR_APP_RELEASE_KEY "$GUITAR_APP/release-key.jks"

guitar () {
  case $1 in
    cat)      echo evil
    ;; wolf)  echo mammal
    ;; duck)  echo bird
    ;; shark) echo fish
    ;; *)     echo I have no idea what a $1 is
  esac
}

guitar_app_dist() {
  cd $GUITAR_APP && \
  npm version patch && \
  quasar build -m cordova -T android && \
  zipalign -v -p 4 "$GUITAR_APP_UNSIGNED" "$GUITAR_APP_ALIGNED" && \
  apksigner sign --ks $GUITAR_APP_RELEASE_KEY --out $GUITAR_APP_SIGNED $GUITAR_APP_ALIGNED && \
  firefox https://drive.google.com/drive/u/0/my-drive && \
  dolphin .
  rm $GUITAR_APP_ALIGNED
}