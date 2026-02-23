op() {
    local operation=`node /home/oli/projects/dotfiles/bash/projects/terminal/projects/cubus/operation-finder.js "$1"`
    echo $operation
    echo $operation | wl-copy
}
