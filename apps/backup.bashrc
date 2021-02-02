#!/bin/bash

## Backup

alias setupkde="cp -avr .genericFiles/.config/ ~"
alias backup="bash ~/.genericFiles/backup_tools.sh"
alias setupall="run-parts -v --test $setup"
alias setuptmux=$setup'tmuxsetup.sh'

# Sets up all of the setups from scripts (broken)
setupAll() {
# Execute all scripts that are in the setupscripts folder
	cd ~/.genericFiles/setupscripts/
	for file in *.sh; do
		bash "$file" || break
	done
	cd -
	echo "Done"
}

# Backup atom package list
backupAtom() {
	touch ~/projects/programmerkit/.atom.packages.list
	apm list --installed --bare > ~/projects/programmerkit/.atom.packages.list
	echo "Done"
}

# Install atom package list
setupAtom() {
	sudo apt-get install atom
	apm install --packages-file ~/projects/programmerkit/.atom.packages.list
	echo "Done"
}


