#!/bin/zsh

runTaskCalledByMain() {
    if ! gitRestore; then
        return;
    fi
    logSuccess "git restore"
}

# Main process.
source ./script__git/base/main.sh
main