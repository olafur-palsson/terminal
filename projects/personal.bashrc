personal_gcloud() {
  if [ -z "$GOOGLE_APPLICATION_CREDENTIALS" ] | [ "$1" = "--force" ]
  then
    var GOOGLE_APPLICATION_CREDENTIALS ~/.gcloud/personal.json
  else
    echo "Not overriding GOOGLE_APPLICATION_CREDENTIALS"
    echo "$GOOGLE_APPLICATION_CREDENTIALS"
    echo "Run 'personal_gcloud --force' to override"
  fi
}

personal_gcloud
