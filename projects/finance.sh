
var FINANCE "$PROJECTS/finance"
var FINANCE_FIREBASE_KEY /home/oli/keys/finance-892a1-firebase-adminsdk-9la62-6d0533c76a.json

tax () {
  cd $FINANCE
  pipenv run "python -m app.tax_report $1 $2"
}