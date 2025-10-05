#!/bin/zsh

runTaskCalledByMain() {
    if ! gitBranchDeleteFullyMerged; then
        return;
    fi

    logSuccess "deleted fully merged local branch."
}

# Main process.
source ./script__git/base/main.sh
main