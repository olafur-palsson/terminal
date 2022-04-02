var WINDOWS "/mnt/c/Users/Olafur"
var CUBUS "$WINDOWS/projects"
var SQL_VOGUE "data source=DESKTOP-G5OK21D\SQLEXPRESS02;initial catalog=master;trusted_connection=true"

sql_vogue() {
  echo 'sqlcmd -S DESKTOP-G5OK21D\SQLEXPRESS02 -E'
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
  cat ~/githubtoken | clipboard
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
	cubeshop "$CUBUS/regalo" "RegaloClientApp" "$@"
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

halldor() {
	cubeshop "$CUBUS/Halldor2021" "HalldorClientApp" "$@"
}

solar() {
	cubeshop "$CUBUS/SolarVendor" "SolarVendorClientApp" "$@"
}

cubeshop() {
	local root="$1"
	local webapproot="$2"
	shift 2
	cd "$root"
	if [ ! -z "$1" ]; then
	    cd "$webapproot"
	    echo "npm ${@: 1}"
	    eval "npm ${@: 1}"
	fi
}

