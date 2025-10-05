## 概要

複数のリポジトリが存在する環境で、
複数のリポジトリに対して一括でgit操作を行えるスクリプト群です。

誤った指定に対しては、警告を表示しmerge/push実行しないことで、事故を防止しています。

## 使い方
### 初回のみ
1. eccube配下に、本コードを配置します. (初回のみ)
  ```
  cd eccube_web/eccube/
  git clone git@github.com:yasuke-kuroda-diezon/script__git.git
  ```

2. script__git/ ディレクトリを、ec-cubeリポジトリのGit管理の対象外とします. (初回のみ)
  ```
  echo "script__git/" >> .git/info/exclude
  ```

3. ・スクリプトに実行権限を付与します (初回のみ)
  ```
  chmod +x ./script__git/*.sh
  ```

### 日々の使い方
1. configファイルに、ブランチの設定を記述します.

  (※設定の記述方法は、ファイル内に記載しています)
  ```
  vim script__git/config/config.sh
  ```

2. スクリプト実行します (例)
```
./script__git/pull.sh
./script__git/delete_fully_merged_branch.sh
```

## スクリプト一覧

以下のファイルは編集不要です。
対象ブランチは、script__git/config/config.shの内容を読み込んで実行します。

| コマンド  | 1つずつのリポジトリに対して行う処理 |
| ------------- | ------------- |
| ./script__git/pull.sh | git pullを実行 |
| ./script__git/checkout.sh | git checkoutを実行 |
| ./script__git/restore.sh | git restoreを実行 |
| ./script__git/merge_and_push.sh | git merge && git pushを実行 |
| ./script__git/delete_untracked_files.sh | git clean -fを実行(git管理してないファイルを削除します) |
| ./script__git/delete_fully_merged_branch.sh | git branch -dを実行(マージ済みブランチを安全に削除します。feature作業ブランチなど。) |

## ディレクトリ構成

```
script__git/
├── config/
│   └── config.sh
├── core/
│   └── main.sh
├── lib/
│   ├── git_command.sh
│   ├── log.sh
│   └── task.sh
├── checkout.sh
├── delete_fully_merged_branch.sh
├── delete_untracked_files.sh
├── merge_and_push.sh
├── pull.sh
├── restore.sh
└── README.md
```

## 安全への配慮
`./script__git/merge_and_push.sh`を実行する際、以下のような危険な操作を防ぐためのバリデーションを行っています。

main(master)ブランチ上で、xxxブランチの内容を取り込むことはできません。
<img width="568" height="219" alt="validate_main" src="https://github.com/user-attachments/assets/a872728e-2437-4602-96e8-dafe96b821d0" />

yyyブランチ上で、staging(develop)ブランチの内容を取り込むことはできません。
<img width="521" height="218" alt="validate_staging" src="https://github.com/user-attachments/assets/6ef2b26e-2515-44af-af71-f726ecf64948" />


## Regolith Headless対応

`config/config.sh`に`projectType="RegolithHeadless"`を指定することで対応可能です。

```
cd regolith-docker/
echo "script__git/" >> .git/info/exclude
chmod +x ./script__git/*.sh
./script__git/pull.sh
```
