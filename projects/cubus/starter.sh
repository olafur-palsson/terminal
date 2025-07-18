
ab() {
  cubusstack "$CUBUS/ABVendor" "CubeShop/ABVendorClientApp" "CubeShop.sln" "$@"
}

bilanaust() {
	cubusstack "$CUBUS/BilanaustVendor" "CubeShop/BilanaustVendorClientApp" "CubeShop.sln" "$@"
}

fjall() {
	cubusstack "$CUBUS/FjallaVendor" "FjallaClientApp" "CubeShop.sln" "$@"
}

hitataekni() {
  cubusstack "$CUBUS/Hrt" "HrtClientApp" "Hrt.sln" "$@"
}

hrt() {
  cubusstack "$CUBUS/Hrt" "HrtClientApp" "Hrt.sln" "$@"
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

tsmypages() {
  cubusstack "$CUBUS/TsMyPages" "MyPagesClientApp" "MyPages.sln" "$@"
}

tri21() {
	cubusstack "$CUBUS/TriWebShop" "TriWebShopClientApp" "CubeShop.sln" "$@"
}

tri() {
	cubusstack "$CUBUS/Tri2024" "TriClientApp" "CubeShop.sln" "$@"
}

vogue() {
	cubusstack "$CUBUS/VogueVendor" "VogueVendorClientApp" "CubeShop.sln" "$@"
}

borguncc() {
  echo "4176 6699 9900 0104"
  echo "12/31 - 012"
  wl-copy "4176669999000104"
}

azmedica() {
	cubusstack "$CUBUS/AzMedica2021" "AzMedicaClientApp" "CubeShop.sln" "$@"
}

brak() {
	cubusstack "$CUBUS/BrakVinVendor" "CubeShop/BrakVinClientApp" "CubeShop.sln" "$@"
}

alias hj21="halldor21"
halldor21() {
	cubusstack "$CUBUS/Halldor2021" "HalldorClientApp" "CubeShop.sln" "$@"
}

alias hj="halldor"
halldor() {
	cubusstack "$CUBUS/Halldor2023" "HalldorClientApp" "CubeShop.sln" "$@"
}

matrix() {
	cubusstack "$CUBUS/SolarMatrix" "OfferMatrix/ClientApp" "OfferMatrix.sln" "$@"
}

alias solarMatrix="matrix"

solar() {
	cubusstack "$CUBUS/SolarVendor" "SolarVendorClientApp" "CubeShop.sln" "$@"
}

adidas() {
	cubusstack "$CUBUS/AdidasVendor" "AdidasClientApp" "CubeShop.sln" "$@"
}

bpro() {
	cubusstack "$CUBUS/BProVendor" "BProClientApp" "CubeShop.sln" "$@"
}

ntc() {
	cubusstack "$CUBUS/NtcVendor" "NtcClientApp" "CubeShop.sln" "$@"
}

skorri() {
	cubusstack "$CUBUS/SkorriVendor" "SkorriVendorClientApp" "CubeShop.sln" "$@"
}

takk() {
	cubusstack "$CUBUS/TakkVendor" "TakkClientApp" "CubeShop.sln" "$@"
}

oj() {
	cubusstack "$CUBUS/OjkVendor" "OjkClientApp" "CubeShop.sln" "$@"
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

ms() {
  cubusstack "$CUBUS/MsVendor" "MsClientApp" "CubeShop.sln" "$@"
}

vendor() {
  if [ "$1" = "start" ]; then
    cubusstack "$CUBUS/SalesVendor" "SalesClientApp" "SalesVendor.sln" start 
  else
	  cubusstack "$CUBUS/SalesVendor" "SalesClientApp" "SalesVendor.sln" "$@"
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

