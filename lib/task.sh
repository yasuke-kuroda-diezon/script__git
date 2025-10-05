# ==================================================================
# ▼ Task.
# ==================================================================

# @param string $targetBranch
function executePullTask() {
    if ! gitFetch; then
        return 1 # means false.
    fi

    local checkoutBranch=$1
    if ! gitCheckout $checkoutBranch; then
        return 1 # means false.
    fi

    if ! gitSetUpstream; then
        return 1 # means false.
    fi

    gitPull
}

# config.shの変数を利用し実行.
# 引数によるブランチ指定ミスを防止し、常に設定ファイルの内容に従わせるため(事故防止).
function executeMergeAndPushTask() {

    # 安全策. mainをマージ元に指定するのは禁止. 必ずBacklog上のPull Requestで行うため.
    if [ "$baseBranch" = "master" ] || [ "$baseBranch" = "main" ]; then
        logWarning "baseBranchに'master'または'main'は指定できません。処理を中止します。"
        return 1 # means false.
    fi

    # 安全策. stagingを取り込む(マージ対象に指定する)ことはないはず.
    if [ "$mergeBranch" = "staging" ] || [ "$mergeBranch" = "develop" ]; then
        logWarning "mergeBranchに'staging'または'develop'は指定できません。処理を中止します。"
        return 1 # means false.
    fi

    if ! executePullTask $mergeBranch; then
        return 1 # means false.
    fi

    if ! executePullTask $baseBranch; then
        return 1 # means false.
    fi

    # merge.
    if ! gitMerge $mergeBranch; then
        return 1 # means false.
    fi

    # push.
    gitPush
}
