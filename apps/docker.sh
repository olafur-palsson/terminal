stopdocker() {
  sudo docker rm $(sudo docker ps -a -q)
}
