#!/bin/zsh

runTask() {
    if ! executeMergeAndPushTask; then
        return;
    fi

    logSuccess "git merge $mergeBranch && git push $(git branch --show-current)"
}

# Main process.
source ./script_git/core/main.sh
main