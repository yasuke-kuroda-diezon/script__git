#!/bin/zsh

runTask() {
    if ! gitBranchDeleteFullyMerged; then
        return;
    fi

    logSuccess "deleted fully merged local branch."
}

# Main process.
source ./script__git/core/main.sh
main