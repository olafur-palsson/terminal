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
