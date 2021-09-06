#!/bin/bash

var DEXTER $PROJECTS/dexter
var GCLOUD_DEV_KEYFILE $PROJECTS/dexter/backend/core/config/keyfile.json
var GCLOUD_PROD_KEYFILE ~/.gcloud/keyfile-prod.json
var DEXTER_CREDS ~/.dexterCredentials.json

# Run Dexter front-end
dexter() {
  cd ~/projects/dexter/frontend
  dexusedev
  quasar dev
}

# dex [--start, --stop]
dex () {
  tkillall && killregex node
  if [ $2 == '--start' ]; then
    firefox > /dev/null &
    slack
    webstorm > /dev/null &
    tmuxinator stop "dexter-$1"
    cd ~/projects/dexter
    tmuxinator "dexter-$1"
  else
    if [ $2 == '--stop' ]; then
      tmuxinator stop "dexter-$1"
    else
      tmuxinator stop "dexter-$1"
      cd ~/projects/dexter
      tmuxinator "dexter-$1"
    fi
  fi
}

# Use dev credentials
dexusedev() {
  export GOOGLE_APPLICATION_CREDENTIALS="$GCLOUD_DEV_KEYFILE "
  sed -i /home/oli/projects/dexter/frontend/config/firebase.js -e 's/true/false/'
  gcloud config set account "dexter-test-c5195@appspot.gserviceaccount.com"

}

# Use prod credentials
dexuseprod() {
  export GOOGLE_APPLICATION_CREDENTIALS="$GCLOUD_PROD_KEYFILE"
  gcloud config set account "dexterdata-e5352@appspot.gserviceaccount.com"
}

# Run the shell for firebase functions
dexshell() {
  firebase functions:shell
}
