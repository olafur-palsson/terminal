#!/bin/bash

rungameid() {
  flatpak run com.valvesoftware.Steam "steam://rungameid/$1"
}


starcraft2() {
  setxkbmap us
  flatpak run com.blizzard.StarCraft2
}

keymapus() {
  setxkbmap us
}

slaythespire() {
  rungameid 646570
}

crusaderkings3() {
  setxkbmap us
  rungameid 1158310
}

factorio() {
  rungameid 427520
}

hollowknight() {
  rungameid 367520
}

oxygen() {
  rungameid 457140
}

rocketls() {
  ls ~/rocket_league_custom
}

rocketload() {
  cp ~/rocket_league_custom/$1 ~/rocket_league_custom/maps/Labs_CirclePillars_P.upk
}
