## Git

# Hard reset to latest changes
alias reset="git fetch --all; git reset --hard $1"

alias g="g-log && git $0"


__git_complete ch _git_checkout
# git checkout shortcut
alias ch="git checkout"

# git status shortcut
alias st="git status"

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
