# ==================================================================
# 設定ファイル.
# ==================================================================
# プロジェクト種別（Regolith または RegolithHeadless を指定ください）
projectType="Regolith"

# スクリプト実行後にいるブランチ.（checkout.sh, pull.sh, merge_and_push.shで使用します）
baseBranch="release/v1.0.0"

# 取り込む対象.（merge_and_push.shで使用します）
mergeBranch="main"

# ==================================================================
# ▼設定例
# ==================================================================
# 例1: stagingブランチにて、release/v1.0.0ブランチの内容を取り込む場合.
# 以下の設定だと、stagingブランチ上で「git merge release/v1.0.0」を実行します.
# baseBranch="staging"
# mergeBranch="release/v1.0.0"

# 例2: release/v1.0.0ブランチにて、mainブランチの内容を取り込む場合.
# 以下の設定だと、release/v1.0.0ブランチ上で「git merge main」を実行します.
# baseBranch="release/v1.0.0"
# mergeBranch="main"
