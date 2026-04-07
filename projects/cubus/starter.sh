
ab() {
  cubusstack "$CUBUS/ab" "CubeShop/ABVendorClientApp" "CubeShop.sln" "$@"
}

bilanaust() {
	cubusstack "$CUBUS/bilanaust" "CubeShop/BilanaustVendorClientApp" "CubeShop.sln" "$@"
}

fjall() {
	cubusstack "$CUBUS/fjallakofinn" "FjallaClientApp" "CubeShop.sln" "$@"
}

fjall-workshop() {
	cubusstack "$CUBUS/fjallakofinn-workshop" "ClientApp" "CubeShop.sln" "$@"
}

hekla() {
  cubusstack "$CUBUS/hekla" "ClientApp" "CubeShop.sln" "$@"
}

hitataekni() {
  cubusstack "$CUBUS/Hrt" "HrtClientApp" "Hrt.sln" "$@"
}

hrt() {
  cubusstack "$CUBUS/Hrt" "HrtClientApp" "Hrt.sln" "$@"
}

regalo() {
	cubusstack "$CUBUS/regalo" "RegaloClientApp" "CubeShop.sln" "$@"
}

stilling() {
	cubusstack "$CUBUS/stilling" "CubeShop/ClientApp" "CubeShop.sln" "$@"
}

tsmypages() {
  cubusstack "$CUBUS/TsMyPages" "MyPagesClientApp" "MyPages.sln" "$@"
}

tri() {
	cubusstack "$CUBUS/tri" "TriClientApp" "CubeShop.sln" "$@"
}

workshop() {
	cubusstack "$CUBUS/workshop" "ClientApp" "CubeShop.sln" "$@"
}

borguncc() {
  echo "4176 6699 9900 0104"
  echo "12/31 - 012"
  wl-copy "4176669999000104"
}

azmedica() {
	cubusstack "$CUBUS/azmedica" "AzMedicaClientApp" "CubeShop.sln" "$@"
}

brak() {
	cubusstack "$CUBUS/BrakVinVendor" "CubeShop/BrakVinClientApp" "CubeShop.sln" "$@"
}

alias hj="halldor"
halldor() {
	cubusstack "$CUBUS/halldor-jonsson" "HalldorClientApp" "CubeShop.sln" "$@"
}

matrix() {
	cubusstack "$CUBUS/solar-matrix" "OfferMatrix/ClientApp" "OfferMatrix.sln" "$@"
}

alias solarMatrix="matrix"

solar() {
	cubusstack "$CUBUS/solar" "SolarClientApp" "CubeShop.sln" "$@"
}

bpro() {
	cubusstack "$CUBUS/bpro" "BProClientApp" "CubeShop.sln" "$@"
}

ntc() {
	cubusstack "$CUBUS/ntc" "NtcClientApp" "CubeShop.sln" "$@"
}

skorri() {
	cubusstack "$CUBUS/SkorriVendor" "SkorriVendorClientApp" "CubeShop.sln" "$@"
}

takk() {
	cubusstack "$CUBUS/takk" "TakkClientApp" "CubeShop.sln" "$@"
}

oj() {
	cubusstack "$CUBUS/OjkVendor" "OjkClientApp" "CubeShop.sln" "$@"
}

ms() {
  cubusstack "$CUBUS/ms-ostakorfur" "MsClientApp" "CubeShop.sln" "$@"
}

vendor() {
  if [ "$1" = "start" ]; then
    cubusstack "$CUBUS/vendor-b2b" "SalesClientApp" "SalesVendor.sln" start 
  else
	  cubusstack "$CUBUS/vendor-b2b" "SalesClientApp" "SalesVendor.sln" "$@"
  fi
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

