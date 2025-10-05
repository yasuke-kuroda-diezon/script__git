#!/bin/zsh

runTask() {
    if ! executePullTask $baseBranch; then
        return;
    fi

    logSuccess "git pull $(git branch --show-current)"
}

# Main process.
source ./script__git/core/main.sh
main