#!/bin/bash

#### Devops

## Git

# Force get the latest updates from master
alias githardreset='git fetch --all; git reset --hard origin/master'


__git_complete ch _git_checkout
# git checkout shortcut
alias ch="git checkout"

# git status shortcut
alias st="git status"

# git add shortcut
alias add="git add"

# git push shortcut
alias push="git push"

__git_complete pull _git_pull
# git pull shortcut
alias pull="git pull"

__git_complete pull _git_pull
# git pull shortcut
alias pullr="git pull --rebase"

__git_complete reb _git_pull
# git pull shortcut
alias reb="git rebase"

__git_complete rebi _git_pull
# git pull shortcut
alias rebi="git rebase --interactive"

# Create diff from branch $1 and push -f to branch $2
squashbranch() {
  our=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  dir=$(git rev-parse --show-toplevel)

  their=$1
  message=$2

  echo "Their branch: $their"
  echo "Our branch $our"
  echo "Message: $message"

  if [ $our = "master" || $our = "staging" ]; then
    echo "Unsafe parameters"
    return 125
  fi

  read -p "Continue? (y/n) " should_continue

  if [ $should_continue = "y" ]; then
    # Soft reset and create a HEAD with the version you want
    git fetch --all
    git reset --soft origin/$their
    git commit -m "Temp commit"
    git checkout $their
    git reset --hard origin/$their

    # Create a temporary branch
    git checkout -b temp-branch

    # Retrieve the diff between master and your-branch and commit with a single commit
    git checkout $our $dir
    git commit -m "$message"

    # Force push to the feature branch
    git push . temp-branch:$our -f

    # Clean up
    git checkout $our
    git branch -D temp-branch
  else
    echo "Cancelled"
  fi
}

## AWS

awsprofile() {
  export AWS_PROFILE=$1
}

## GCLOUD

fireshell() {
  firebase functions:shell
}
