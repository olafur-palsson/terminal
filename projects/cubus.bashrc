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
  cubeshop "$CUBUS/ABVendor" "CubeShop/ABVendorClientApp" "$@"
}

rekkjan() {
	cubeshop "$CUBUS/RekkjanVendor" "RekkjanVendorClientApp" "$@"
}

sekkur() {
	cubeshop "$CUBUS/SekkurVendor" "SekkurVendorClientApp" "$@"
}

regalo() {
	cubeshop "$CUBUS/Regalo" "RegaloClientApp" "$@"
}

bilanaust() {
	cubeshop "$CUBUS/BilanaustVendor" "CubeShop/BilanaustVendorClientApp" "$@"
}

tri() {
	cubeshop "$CUBUS/TriWebShop" "TriWebShopClientApp" "$@"
}

vogue() {
	cubeshop "$CUBUS/VogueVendor" "VogueVendorClientApp" "$@"
}

brak() {
	cubeshop "$CUBUS/BrakVinVendor" "CubeShop/BrakVinClientApp" "$@"
}

alias hj="halldor"
halldor() {
	cubeshop "$CUBUS/Halldor2021" "HalldorClientApp" "$@"
}

solar() {
	cubeshop "$CUBUS/SolarVendor" "SolarVendorClientApp" "$@"
}

bpro() {
	cubeshop "$CUBUS/BProVendor" "BProClientApp" "$@"
}

ntc() {
	cubeshop "$CUBUS/NtcVendor" "NtcClientApp" "$@"
}

gap() {
	cubeshop "$CUBUS/GapVendor" "GapClientApp" "$@"
}

vendor() {
	cubeshop "$CUBUS/CubeShop" "FrontendClientApp" "$@"
}

cubeshop() {
	local command="$0"
	local root="$1"
	local webapproot="$2"
	shift 2
	cd "$root"

	if [ ! -z "$1" ]; then
	    cd "$webapproot"
	    if [ "$1" = "storm" ]; then
	    	nohup webstorm . & echo "Webstorm for $webapproot started"
	    elif [ "$1" = "all" ]; then
	    	eval "cubeshop $root $webapproot storm"
	    	eval "cubeshop $root $webapproot ride"
	    	eval "cubeshop $root $webapproot start"
	    elif [ "$1" = "ride" ]; then
	    	cd -
	    	nohup rider CubeShop.sln & echo "Rider for $root started"
	    else
	        echo "npm ${@: 1}"
	        eval "npm ${@: 1}"
	    fi
	fi
}

