#!/bin/bash

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

rocketls() {
  ls ~/rocket_league_custom
}

rocketload() {
  cp ~/rocket_league_custom/$1 ~/rocket_league_custom/maps/Labs_CirclePillars_P.upk
}
