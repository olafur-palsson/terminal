#!/bin/bash

export DEXTER="$PROJECTS/dexter"

# Run Dexter front-end
dexter() {
  cd ~/projects/dexter/frontend
  dexusedev
  quasar dev
}

# dex [--start, --stop]
dex () {
  if [ $2 == '--start' ]; then
    firefox
    webstorm &
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
  export GOOGLE_APPLICATION_CREDENTIALS="/home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json"
  sed -i /home/oli/projects/dexter/frontend/config/firebase.js -e 's/true/false/'
  gcloud config set account "dexter-test-c5195@appspot.gserviceaccount.com"

}

# Use prod credentials
dexuseprod() {
  export GOOGLE_APPLICATION_CREDENTIALS="/home/oli/Downloads/dexterdata-e5352-6ebca7986e93.json" && sed -i /home/oli/projects/dexter/frontend/config/firebase.js -e 's/false/true/'
  gcloud config set account "dexterdata-e5352@appspot.gserviceaccount.com"
}

# Run the shell for firebase functions
dexshell() {
  firebase functions:shell
}