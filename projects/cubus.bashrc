#!/bin/bash

var CUBUS "/home/oli/projects"
var SQL_VOGUE "data source=DESKTOP-G5OK21D\SQLEXPRESS02;initial catalog=master;trusted_connection=true"

var NODE_OPTIONS --max_old_space_size=8048

sql_vogue() {
  echo 'sqlcmd -S DESKTOP-G5OK21D\SQLEXPRESS02 -E'
}

endwork() {
  echo "Logging time..."
  uptime -s | xargs ts-node "$CUBUS/harvest/logTimeToHarvest.ts" && sleep 0.5 && systemctl poweroff
}

alias day_of_the_week="date +%u -d"
weekdays_current_month() {
  local startdate=`date +%Y-%m-01`
  local enddate=`date -d "$startdate +1 month" +%Y-%m-01`
  local count=0

  while [ "$startdate" != "$enddate" ]; do 
    local dow=`day_of_the_week $startdate`
    if [ "$dow" -lt 6 ]; then
      count=$(($count + 1))
    fi
    startdate=$(date -I -d "$startdate + 1 day")
  done
  echo $count
}

hours_to_work_per_day() {
  local days=`weekdays_current_month`
  echo -e "import math \nprint(str(math.floor(120 / $days)) + ':' + str(round((120 / $days - 5) * 60)))" | python3
}

cubadd() {
  cd ~/projects/
  git clone "https://github.com/Fannsker/$1"
  cd CubeShop
  local clientApp=`ls -1 | grep ClientApp | head -1`
  cd $clientApp
  npm i --legacy-peer-deps && npm start
}

hours_to_work_per_week() {
  local days=`weekdays_current_month`
  local result=`echo -e "import math \nprint(str(math.floor(600 / $days)) + ':' + str(round((600 / $days - 5) * 60)))" | python3` 
  echo $result | cut -c-5
}

cucommit() {
  cd `git rev-parse --show-toplevel`
  git add .
  git reset wwwroot
  git reset CubeShop/wwwroot
  if [ -z "$1" ]
  then
    echo "No arg provided"
  else
    git commit -m "$1"
  fi
}

cubranch() {
  local dateString=$(date +'%Y%m%d')
  if [ -z "$1" ]
  then
    echo "No arg provided"
  else
    ch -b "$dateString-$1"
  fi
}

cunexttask() {
  if [ -z "$1" ]
  then
    echo "No project provided"
  else
    if [ -z "$2" ]
    then
      echo "No new-branch name provided"
    else
      eval "$1"
      if [ -z "$3" ]
      then
        echo "Branching off main"
	g-reset main && cubranch "$2" && eval "$1 start"
      else
        g-reset "$3" && cubranch "$2" && eval "$1 start"
      fi
    fi
  fi

}

ghtoken() {
  cat ~/.no_move_these/githubtoken | clipboard
}

ab() {
  cubusstack "$CUBUS/ABVendor" "CubeShop/ABVendorClientApp" "CubeShop.sln" "$@"
}

rekkjan() {
	cubusstack "$CUBUS/RekkjanVendor" "RekkjanVendorClientApp" "CubeShop.sln" "$@"
}

sekkur() {
	cubusstack "$CUBUS/SekkurVendor" "SekkurVendorClientApp" "CubeShop.sln" "$@"
}

regalo() {
	cubusstack "$CUBUS/Regalo" "RegaloClientApp" "CubeShop.sln" "$@"
}

bilanaust() {
	cubusstack "$CUBUS/BilanaustVendor" "CubeShop/BilanaustVendorClientApp" "CubeShop.sln" "$@"
}

tri() {
	cubusstack "$CUBUS/TriWebShop" "TriWebShopClientApp" "CubeShop.sln" "$@"
}

vogue() {
	cubusstack "$CUBUS/VogueVendor" "VogueVendorClientApp" "CubeShop.sln" "$@"
}

brak() {
	cubusstack "$CUBUS/BrakVinVendor" "CubeShop/BrakVinClientApp" "CubeShop.sln" "$@"
}

alias hj="halldor"
halldor() {
	cubusstack "$CUBUS/Halldor2021" "HalldorClientApp" "CubeShop.sln" "$@"
}

solar() {
	cubusstack "$CUBUS/SolarVendor" "SolarVendorClientApp" "CubeShop.sln" "$@"
}

bpro() {
	cubusstack "$CUBUS/BProVendor" "BProClientApp" "CubeShop.sln" "$@"
}

ntc() {
	cubusstack "$CUBUS/NtcVendor" "NtcClientApp" "CubeShop.sln" "$@"
}

gap() {
	cubusstack "$CUBUS/GapVendor" "GapClientApp" "CubeShop.sln" "$@"
}

rarik() {

  if [ "$1" = "start" ]; then
    cubusstack "$CUBUS/Rarik" "ClientApp" "MyPages2023.sln" start -- -- --port "8080"
  else
    cubusstack "$CUBUS/Rarik" "ClientApp" "MyPages2023.sln" "$@"
  fi
}

vendor() {
	cubusstack "$CUBUS/CubeShop" "FrontendClientApp" "CubeShop.sln" "$@"
}

pascal-camel() {
  echo "${1^}"
}

camel-pascal() {
  echo "${1,}"
}

camel-kebab() {
  sed --expression 's/\([A-Z]\)/-\L\1/g' \
      --expression 's/^-//'              \
      <<< "$1"
}

copy-replace() {
  echo $1
  if [[ -z "$1" ]]; then
    echo "Error, no string"
    return 1
  fi

  camel=`pascal-camel $1`
  kebab=`camel-kebab $camel`
  pascal=`camel-pascal $1`
  mkdir $kebab
  cp template/* $kebab
  cd $kebab
  ls -1 | xargs sed -i "s/TemplateString/$camel/g"
  ls -1 | xargs sed -i "s/templateString/$pascal/g"
  ls -1 | xargs sed -i "s/template-string/$kebab/g"
  for f in *; do mv "$f" "$(echo "$f" | sed s/template-string/$kebab/)"; done
  cd ..
}

cutunnel() {
  ngrok http https://localhost:5001
}

cubelog() {
  cat ~/project-log.txt | awk 'NR % 4 == 0' 
}

cubusstack() {
	local root="$1"
	local webapproot="$2"
  local solutionName="$3"
  local command="${@: 4}"
  echo "Root: $root, $webapproot, Sln: $solutionName, Cmd: $command"
	cd "$root"
  node "$TERMINAL/scripts/project-logger.js" "$webapproot" "$command" >> ~/project-log.txt

  echo "Executing $command"
	if [ ! -z "$command" ]; then
	    cd "$webapproot"
	    if [ "$command" = "storm" ]; then
	    	nohup webstorm . & echo "Webstorm for $webapproot started"
	    elif [ "$command" = "startup" ]; then
	    	nohup slack & echo "Slack started"
	    	nohup spotify & echo "Spotify started"
	    	nohup datagrip & echo "Spotify started"
	    	nohup birdtray & echo "Thunderbird started"
	    	nohup surfshark & echo "Surfshark started"
        nohup sh -c 'XAPP_FORCE_GTKWINDOW_ICON=/home/oli/Data/Downloads/asana-logo-favicon@3x.png firefox --class WebApp-Asana7446 --profile /home/oli/.local/share/ice/firefox/Asana7446 --no-remote http://asana.com' & echo "Asana started"
	    	eval "cubusstack $root $webapproot $solutionName all"
	    elif [ "$command" = "all" ]; then
	    	eval "cubusstack $root $webapproot $solutionName storm"
	    	eval "cubusstack $root $webapproot $solutionName ride"
	    	eval "cubusstack $root $webapproot $solutionName start"
	    elif [ "$command" = "ride" ]; then
	    	cd -
	    	nohup rider "$solutionName" & echo "Rider for $root started"
	    else
	        echo "npm ${@: 4}"
	        eval "npm ${@: 4}"
	    fi
	fi
}

