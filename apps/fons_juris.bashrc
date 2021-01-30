#!/bin/bash


fons() {
  cd ~/projects/fonsjuris
  case $1 in
    server)
      cd server
      pipenv shell awsprofile law-stuff
      ;;

    *)
      echo "Not a valid command $1"
     ;;
  esac
}