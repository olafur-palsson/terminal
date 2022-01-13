var WINDOWS "/mnt/c/Users/Olafur"
var CUBUS "$WINDOWS/projects"

cucommit() {
  cd `git rev-parse --show-toplevel`
  git add .
  git reset wwwroot
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

ghtoken() {
  cat ~/githubtoken | clipboard
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

