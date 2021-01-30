# TODO :
#   Make an 'install -s' function for apt that installs into a list of files to install after backup
#   Maybe make a package.json type of file to backup and extract from stuff.



#:wq!/bin/bash

import() {
  if [ -f $1 ]
  then
    . $1
  fi
}

var() {
  eval "export $1=\"$2\""
}

path() {
  eval var PATH "$PATH:$1"
}

export TERMINAL="~/projects"

# Load .bashrc here
import ~/.init.bashrc # Very~/ generic .bashrc
import ~/.backup.bashrc # Bacup tools
import ~/.compile.bashrc # Some compilation stuff
import ~/.console.bashrc # Tools for bash
import ~/.devops.bashrc # Devops stuff
import ~/.project.bashrc # Stuff related to current projects
import ~/.vars.bashrc # Path vars and more

## Current project shortcuts
alias velmodel="watch_do ./src '*pp' 'cmake . -DCMAKE_PREFIX_PATH=libtorch; make'"

## Variables

gen='~/.genericFiles/'
setup="$gen""setupscripts/"

var EDITOR nvim
var PYTHON_STARTUP "$HOME/.pythonrc"
var ANDROID_HOME /usr/lib/android-sdk
var GOOGLE_APPLICATION_CREDENTIALS /home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json
var GCLOUD_DEV_KEYFILE /home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json
var GCLOUD_PROD_KEYFILE /home/oli/Downloads/dexterdata-e5352-6ebca7986e93.json

path /home/pimp-of-pimps/anaconda/bin
path ~/java8/java8


## Shortcuts

alias helpv="help; view README.md"
alias atom='taskset --cpu-list 1,2,3 atom'

killregex() {
  ps -Alf |grep -i $1 |grep -v grep |awk -F' ' '{print $4}' |xargs kill -9
}

alias sobash=". ~/.bashrc"
alias docker="sudo docker"
#docker always sudo


alias pybook="jupyter notebook"
# Simple alias for 'jupyter notebook'

alias uninstalljava="sudo ~/.genericFiles/uninstallJava.sh"
# Uninstalls all of Java

## Calculator

alias calc="bpython -i ~/.calc.py"
alias calcedit="nvim ~/.calc.py"
alias firebasu="firebase"
alias searchhistory="history | grep"

hubstaffreport() {
  today=$(date '+%Y-%m-%d')
  day=$(date --date="$1" '+%Y-%m-%d')

  base='https://app.hubstaff.com/reports/308837/team/apps_and_urls?date='
  date_end='&date_end='
  end_of_string='%5Binclude_archived%5D=true&filters%5Bitem_type%5D=apps_and_urls'

  firefox "$base$day$date_end$today$end_of_string"
}


hubstaffweek() {
  a_week_ago=$(date --date="7 days ago" '+%Y-%m-%d')
  hubstaffreport "7 days ago"
}

hubstafftoday() {
  today=$(date '+%Y-%m-%d')
  a_day_ago=
  hubstaffreport today
}


hubstaffyesterday() {
  yesterday=$(date --date="yesterday" '+%Y-%m-%d')
  hubstaffreport yesterday
}

hubstaffyesterday() {
  a_day_ago=$(date --date="1 day ago" '+%Y-%m-%d')
  hubstaffreport $a_week_ago
}

dexusedev() {
  export GOOGLE_APPLICATION_CREDENTIALS="/home/oli/projects/dexter/legacy-functions/functions/utils/services/__service_account_dev.json"
  sed -i /home/oli/projects/dexter/frontend/config/firebase.js -e 's/true/false/'
  gcloud config set account "dexter-test-c5195@appspot.gserviceaccount.com"

}

dexuseprod() {
  export GOOGLE_APPLICATION_CREDENTIALS="/home/oli/Downloads/dexterdata-e5352-6ebca7986e93.json" && sed -i /home/oli/projects/dexter/frontend/config/firebase.js -e 's/false/true/'
  gcloud config set account "dexterdata-e5352@appspot.gserviceaccount.com"
}

dexshell() {
  firebase functions:shell
}


## MISC

newcpp() {
  # Creates a new cpp file with an acompanying header file as .cpp and .hpp
  cppPath=$HOME"/.genericFiles/c++tools/"
  headerboiler=$cppPath"header.hpp"
  baseboiler=$cppPath"base.cpp"
}

compilecpp() {
  name=$1
  caps=$(echo $name | awk '{ print toupper($0) }')
  cat $baseboiler | sed "s/filename/$name/g" > $name.cpp
  cat $headerboiler | sed "s/filename/$name/g" | sed "s/capsname/$caps/g" > $name.hpp
}

gppp() {
  # compile with output file as 'filename.o' with std=c++17
  filename=$(echo $1 | cut -d'.' -f 1)
  g++ -o $filename'.o' $1 -std=c++14
  unset $filename
}

nightmodeupdate() {
  node ~/.nightmode.js | bash
}

python_unittest_runner() {
    watch_do . '.*py' 'clear && python -m unittest' true
}

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

starcraft2() {
  setxkbmap us
  flatpak run com.blizzard.StarCraft2
}

crusaderkings3() {
  setxkbmap us
  steam steam://rungameid/1158310
}

hollowknight() {
  steam steam://rungameid/367520
}

awsprofile() {
  export AWS_PROFILE=$1
}

fireshell() {
  firebase functions:shell
}

dexter() {
  cd ~/projects/dexter/frontend
  dexusedev
  quasar dev
}

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

checkfiles() {
  folder=$1
  regex=$2
  string_to_find=$3
  COUNTER=0
  ((COUNTER++))
  count2=0
  find $folder | grep -e $regex | while read -r line
  do
    if cat $line | grep -e $string_to_find
    then
      COUNTER=$[$COUNTER +1]
      echo $line
      cat -n $line | grep -e $string_to_find | echo
    fi
  done
  echo $COUNTER number of files
}

rocketls() {
  ls ~/rocket_league_custom
}
rocketload() {
  cp ~/rocket_league_custom/$1 ~/rocket_league_custom/maps/Labs_CirclePillars_P.upk
}

cron_job_10_minutes() {
  killpwms
}

template() {
  xclip -sel c < ~/.code-templates/$1
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/oli/projects/awstests/node_modules/tabtab/.completions/serverless.bash ] && . /home/oli/projects/awstests/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/oli/projects/awstests/node_modules/tabtab/.completions/sls.bash ] && . /home/oli/projects/awstests/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/oli/projects/awstests/node_modules/tabtab/.completions/slss.bash ] && . /home/oli/projects/awstests/node_modules/tabtab/.completions/slss.bash

