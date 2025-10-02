#!/bin/zsh

runTask() {
    if ! gitCleanForce; then
        return;
    fi

    logSuccess "deleted untracked files."
}

# Main process.
source ./script_git/core/main.sh
main