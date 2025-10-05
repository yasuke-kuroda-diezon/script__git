#!/bin/zsh

runTask() {
    if ! gitCheckout $baseBranch; then
        return;
    fi

    logSuccess "git checkout $(git branch --show-current)"
}

# Main process.
source ./script__git/core/main.sh
main