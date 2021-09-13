g-rebase-branch() {
  git branch --show-current | xargs git merge-base master | xargs git rebase -i
}

g-one-commit() {
  local last_commit_message=`git show -s --format=%s`
  git branch --show-current | xargs git merge-base master | xargs git reset --soft
  git add -A
  git commit -m "$last_commit_message"
  git commit --amend
}