#!/bin/zsh

runTaskCalledByMain() {
    if ! gitCleanForce; then
        return;
    fi

    logSuccess "deleted untracked files."
}

# Main process.
source ./script__git/base/main.sh
main