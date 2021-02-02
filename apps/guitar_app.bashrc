#!/bin/bash

alias guitar-app="tmuxinator_app 'guitar-app'"
export GUITAR_APP="$HOME/projects/guitar-app"

export GUITAR_APP_UNSIGNED="$GUITAR_APP/mobile/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"

export GUITAR_APP_MOBILE="$GUITAR_APP/mobile"
export GUITAR_APP_ALIGNED="$GUITAR_APP_MOBILE/aligned.apk"
export GUITAR_APP_SIGNED="$GUITAR_APP_MOBILE/signed.apk"
export GUITAR_APP_RELEASE_KEY="$GUITAR_APP_MOBILE/release-key.jks"

guitar_app_build_android() {
  cd $GUITAR_APP_MOBILE
  android_home_old=$ANDROID_HOME
  export ANDROID_HOME=$ANDROID_SDK_ROOT
  cordova build --release
  zipalign -v -p 4 "$GUITAR_APP_UNSIGNED" "$GUITAR_APP_ALIGNED"
  apksigner sign --ks $GUITAR_APP_RELEASE_KEY --out $GUITAR_APP_SIGNED $GUITAR_APP_ALIGNED
  rm $GUITAR_APP_ALIGNED
  export ANDROID_HOME=$android_home_old
}

guitar_app_run() {
  cd $GUITAR_APP_MOBILE
  export ANDROID_HOME=$ANDROID_SDK_ROOT
  cordova_
}