# ==================================================================
# ▼ main functions.
# ==================================================================
source ./script__git/config/config.sh
source ./script__git/lib/git_command.sh
source ./script__git/lib/log.sh
source ./script__git/lib/task.sh

# Regolith.
# eccube/ と app/Plugin/ に対して実行.
function executeRegolith() {
    # ▼ for eccube dir.
    printDirectoryInfo
    runTask

    # ▼ for Plugin dirs.
    cd app/Plugin
    for dir in */; do
        # .git/を含むディレクトリのみを対象にする.
        if [ ! -d "${dir}.git" ]; then
            continue
        fi

        cd $dir
        printDirectoryInfo
        runTask
        cd -
    done
}

# RegolithHeadless.
# 管理画面、ユーザー画面、API、API Gateway に対して実行.
function executeRegolithHeadLess() {
    dirs=(
        "regolith-front-ctr/regolith-front"
        "regolith-admin-ctr/regolith-admin"
        "regolith-api-ctr/regolith-api"
        "regolith-gateway"
    )
    for dir in "${dirs[@]}"; do
        cd $dir
        printDirectoryInfo
        runTask
        cd -
    done
}

function main() {
    logInfo "Script Start."

    # ▼ config.sh > projectType の値に応じて実行関数を切り替える.
    if [ "$projectType" = "Regolith" ]; then
        executeRegolith
    elif [ "$projectType" = "RegolithHeadless" ]; then
        executeRegolithHeadLess
    else
        logError "Unknown projectType: $projectType"
        exit 1
    fi

    echo "\n"
    logInfo "Script End."
}
