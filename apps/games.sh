#!/bin/bash

starcraft2() {
  setxkbmap us
  flatpak run com.blizzard.StarCraft2
}

keymapus() {
  setxkbmap us
}

crusaderkings3() {
  setxkbmap us
  steam steam://rungameid/1158310
}

factorio() {
  steam steam://rungameid/427520
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
