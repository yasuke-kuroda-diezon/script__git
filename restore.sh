#!/bin/zsh

runTask() {
    if ! gitRestore; then
        return;
    fi
    logSuccess "git restore"
}

# Main process.
source ./script_git/core/main.sh
main