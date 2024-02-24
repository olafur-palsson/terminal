getip() {
  wl-copy `curl https://europe-north1-yoloproj-384909.cloudfunctions.net/hello-node-function/ip`
  wl-paste 
}

setip () {
  curl https://europe-north1-yoloproj-384909.cloudfunctions.net/hello-node-function/update
}

server() {
  local pass=`cat ~/serverpass`
  _server "$pass"
}

_server() {
  cd ~
  sshpass -p$1 ssh oli@192.168.1.213
}

# personal_gcloud
