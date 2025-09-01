
cutunnel() {
  ngrok http https://localhost:5001
}

vendortunnel() {
  ngrok http https://localhost:44438
}

harvestTime() {
  node ~/projects/harvest/index.js
}

cubelog() {
  cat ~/project-log.txt | awk 'NR % 4 == 0' 
}

mrkrab() {
  nohup vlc -f "$TERMINAL/resources/congrats.mp4" &
}

teamviewer() {
  wl-copy "1679583842"
  echo "Teamviewer ID copied, press enter to copy password"
  read local yolo
  wl-copy "b3hwe4vg"
}

custart() {
  nohup slack --enable-features=WebRTCPipeWireCapturer & echo "Slack started"
  nohup spotify & echo "Spotify started"
  nohup datagrip & echo "Datagrip started"
  nohup birdtray & echo "Thunderbird started"
  nohup surfshark & echo "Surfshark started"
  nohup flatpak run --branch=stable --arch=x86_64 --command=teams-for-linux --file-forwarding com.github.IsmaelMartinez.teams_for_linux @@u %U @@ & echo "MS Teams started"
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
      if [ "$command" = "new" ]; then
        git add .
        git stash
        ch main
        git pull
	    	eval "cubusstack $root $webapproot $solutionName all"
	    elif [ "$command" = "storm" ]; then
	    	nohup webstorm . & echo "Webstorm for $webapproot started"
	    elif [ "$command" = "startup" ]; then
        custart
	    	eval "cubusstack $root $webapproot $solutionName all"
	    elif [ "$command" = "all" ]; then
	    	eval "cubusstack $root $webapproot $solutionName storm"
	    	eval "cubusstack $root $webapproot $solutionName ride"
	    	eval "cubusstack $root $webapproot $solutionName start"
	    elif [ "$command" = "ride" ]; then
	    	cd -
	    	nohup rider "$solutionName" & echo "Rider for $root started"
	    else
	        echo "bun ${@: 4}"
	        eval "bun ${@: 4}"
	    fi
	fi
}

usenpm() {
  json -I -f angular.json -e "this.cli.packageManager='npm'"
}

usebun() {
  json -I -f angular.json -e "this.cli.packageManager='bun'"
}

borguncc() {
  echo "4176 6699 9900 0104"
  echo "12/31 - 012"
  wl-copy "4176669999000104"
}

verifonecc() {
  echo "4000 0000 0000 1091"
  echo "01/23 - 734"
  wl-copy "4000000000001091"
}

straumurcc() {
  echo "4917 6100 0000 0000"
  echo "03/30 - 737"
  wl-copy "4917610000000000"
}


valitorcc() {
  echo "9999 9999 9999 9999"
  echo "12/31 - 012"
  wl-copy "9999999999999999"
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

cupr() {
    local branch=`git branch --show`
  if [ -z "$1" ]
  then
      echo "No arg provided"
  else
      cubranch $1
      local message=`echo "$str" | sed -E 's/([A-Z])/\ \1/g' | sed 's/^ //'`
      git commit -m "$message"
      g-push
      pr
  fi
}

cubadd() {
  cd ~/projects/
  git clone "https://github.com/Fannsker/$1"
  cd CubeShop
  local clientApp=`ls -1 | grep ClientApp | head -1`
  cd $clientApp
  npm i --legacy-peer-deps && npm start
}

codegen() {
  node "$CUBUS/sql-codegen/store-proc-gen.js" $1
}
