gitgood() {
  git branch --show-current | xargs git merge-base master
  local current=`git branch --show-current`
  local mergebase=`git merge-base master`
  git reset
}
