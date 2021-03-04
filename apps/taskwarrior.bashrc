#!/bin/bash

## Task Warrior

# View what is due in the next 7 days on taskwarrior
alias tt="task due.after:now-7days list"

# View next due task
alias ttn="task due.after:now-7days list | head -4; echo ' '"

# All containing the word 'Verk' (i.e. work material)
alias ttv="tt | grep -e 'Verk'"

alias ttvn="ttv | head -1"
