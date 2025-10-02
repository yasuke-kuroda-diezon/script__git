# ==================================================================
# ▼ git command functions.
# ==================================================================
function gitFetch() {
    if ! git fetch --all --quiet; then
        logError "git fetch failed."
        return 1 # means false.
    fi

    # logSuccess "git fetch $(git branch --show-current)"
}

function gitSetUpstream() {
    if ! git branch --set-upstream-to=origin/$(git branch --show-current) --quiet; then
        logError "git set-upstream $(git branch --show-current) failed."
        return 1 # means false.
    fi

    # logSuccess "git set-upstream $(git branch --show-current)"
}

function gitPull() {
    if ! git pull --prune; then
        logError "git pull $(git branch --show-current) failed."
        return 1 # means false.
    fi

    # logSuccess "git pull $(git branch --show-current)"
}

function gitPush() {
    if ! git push; then
        logError "git push $(git branch --show-current) failed."
        return 1 # means false.
    fi

    # logSuccess "git push $(git branch --show-current)"
}

# @param string $mergeBranch
function gitMerge() {
    local mergeBranch=$1 # argument.
    if ! git merge $mergeBranch --no-ff --no-edit; then
        logError "git merge ${mergeBranch} failed."
        git merge --abort
        return 1 # means false.
    fi

    # logSuccess "git merge ${mergeBranch}"
}

# @param string $targetBranch
function gitCheckout() {
    local targetBranch=$1 # argument.
    if [ "$targetBranch" = "$(git branch --show-current)" ]; then
        return;
    fi

    if ! git switch $targetBranch --quiet; then
        logError "git checkout ${targetBranch} failed."
        return 1 # means false.
    fi

    # logSuccess "git checkout $(git branch --show-current)"
}

function gitRestore() {
    if ! git restore .; then
        logError "git restore . failed."
        return 1 # means false.
    fi

    # logSuccess "git restore"
}

function gitBranchDeleteFullyMerged() {
    if ! git branch --merged | grep -v "\*" | xargs git branch -d; then
        logError "delete fully merged local branch failed."
        return 1 # means false.
    fi

    # logSuccess "deleted fully merged local branch."
}

function gitCleanForce() {
    if ! git clean -f -d; then
        logError "delete untracked files failed."
        return 1 # means false.
    fi

    # logSuccess "deleted fully merged local branch."
}
