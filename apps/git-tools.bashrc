g-log() {
  local current-time=`date --iso-8601=seconds`
  echo "$current-time | $0" >> ~/.git-log
}


g-rebase-branch() {
  if [ -z "$1" ]
  then
    echo "Provide branch in first arg"
  else
    git branch --show-current | xargs git merge-base "$1" | xargs git rebase -i
  fi
}

g-one-commit() {
  if [ -z "$1" ]
  then
    echo "Provide branch in first arg"
  else
    local last_commit_message=`git show -s --format=%s`
    git branch --show-current | xargs git merge-base "$1" | xargs git reset --soft
    git add -A
    git commit -m "$last_commit_message"
    git commit --amend
  fi
}

g-reset() {
  if [ -z "$1" ]
  then
    echo "Provide branch in first arg"
  else
    git checkout "$1"
    git add -A
    git stash
    git fetch --all
    git reset --hard "origin/$1"
  fi
}

g-new-patch() {
  if [ -z "$1" ]
  then
    echo "Provide git version ref in first arg"
  else
    git log -p --reverse --pretty=email --stat -m --first-parent "$1"
  fi
}

g-apply-patch() {
  if [ -z "$1" ]
  then
    echo "Provide path to patch in first arg"
  else
    git am --ignore-whitespace --ignore-space-change --reject < "$1"
  fi
}


alias g-push='git push origin `git branch --show-current`'
