var GCLOUD_SHOP_DEV "/home/oli/.gcloud/shop-dev.json"
var GCLOUD_SHOP_PROD "/home/oli/.gcloud/shop-prod.json"
var SHOP "/home/oli/projects/test-shop"

shop-prod() {
  var GOOGLE_APPLICATION_CREDENTIALS "$GCLOUD_SHOP_PROD"
}

shop-dev() {
  var GOOGLE_APPLICATION_CREDENTIALS "$GCLOUD_SHOP_DEV"
}

shop () {
  cd $SHOP
}
