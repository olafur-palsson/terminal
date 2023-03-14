#!/bin/bash
## Git

# Hard reset to latest changes
alias reset="git fetch --all; git reset --hard $1"

alias g="g-log && git $0"


__git_complete ch _git_checkout
# git checkout shortcut
alias ch="git checkout"

# git status shortcut
alias st="git status"

# Get recent branches, copy ref to clipboard
refc() {
  if [ -z "$1" ]; then
    git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | cat -n
  else
    local re='^[0-9]+$'
    if ! [[ "$1" =~ $re ]] ; then
      local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | grep -e "$1" | tail -1)
      echo -n $branch | xclip -selection clipboard
    else
      local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | sed -n "$1"p)
      echo -n $branch | xclip -selection clipboard
    fi
    #local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | sed -n "$1"p)
    #ch $branch
  fi
}

ref() {
  if [ -z "$1" ]; then
    banner "Pick branch"
    local branch=`git reflog \
      | grep -o "checkout: moving from .* to " \
      |    sed -e 's/checkout: moving from //' -e 's/ to $//' \
      | grep -ve "[a-f0-9]\{20\}" \
      | uniq \
      | gum filter`
    echo $branch
    if [ -z "$branch" ]; then
      echo "No branch"
    else
      ch $branch
    fi
  else
    local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | sed -n "$1"p)
    ch $branch
  fi
}

# Get recent branches, navigate by number
ref2() {
  if [ -z "$1" ]; then
    git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | cat -n
  else
    local re='^[0-9]+$'
    if ! [[ "$1" =~ $re ]] ; then
      local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | grep -e "$1" | tail -1)
      ch $branch
    else
      local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | sed -n "$1"p)
      ch $branch
    fi
    #local branch=$(git reflog | grep -oe "[0-9]\{8\}[^ ]\+" > /tmp/temp && tac /tmp/temp | sed -n "$1"p)
    #ch $branch
  fi
}

merge() {
  local filename=`st | grep "$1" | grep -oh "[ ][^ ]*$" | head -1`
  lvim $filename
}

# git ammend no edit shortcut
alias am="git commit --amend --no-edit"

# git add shortcut
alias addall="git add -A"

__git_complete push _git_pull
# git push shortcut
alias push="git push"

__git_complete pull _git_pull
# git pull shortcut
alias pull="git pull"

__git_complete pull _git_pull
# git pull shortcut
alias pullr="git pull --rebase"
