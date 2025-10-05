#!/bin/zsh

runTaskCalledByMain() {
    if ! executePullTask $baseBranch; then
        return;
    fi

    logSuccess "git pull $(git branch --show-current)"
}

# Main process.
source ./script__git/base/main.sh
main