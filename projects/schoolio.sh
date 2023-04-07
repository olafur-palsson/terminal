var GCLOUD_SCHOOLIO_DEV "/home/oli/.gcloud/schoolio-dev.json"
var GCLOUD_SCHOOLIO_PROD "/home/oli/.gcloud/schoolio.prod.json"

schoolio-dev() {
  var GOOGLE_APPLICATION_CREDENTIALS "$GCLOUD_SCHOOLIO_DEV"
}
