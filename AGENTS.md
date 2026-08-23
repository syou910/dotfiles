# AGENTS.md

このリポジトリは chezmoi のソースディレクトリです。作業時は以下の規約に従ってください。

## 構成

- `.chezmoiroot` に `home` を指定しているため、実際のファイルは `home/` 配下に置く
- ファイル名は chezmoi の命名規則に従う
  - `dot_config/` → `~/.config/`
  - `dot_gitconfig` → `~/.gitconfig`
- テンプレートが必要な場合は拡張子に `.tmpl` を付ける

## 作業手順

1. `chezmoi edit <対象ファイル>` または `chezmoi cd` 後に直接編集する
2. 変更後は必ず `chezmoi diff` で反映内容を確認し、問題なければ `chezmoi apply` を実行する
3. コミット前に `chezmoi managed` と `chezmoi doctor` で状態を確認する

## 禁止事項

- 秘密鍵・トークン・パスワードなどの機密情報をコミットしない
  (`home/dot_ssh/` には `config` のみを置き、秘密鍵は管理しない)
- `chezmoi apply --force` や削除系コマンド (`chezmoi forget`, `chezmoi purge`) を安易に使わない

## 前提環境

- シェル: fish (プロンプト: pure, テーマ: Iceberg)
- エディタ: nano (`$EDITOR`)
- パッケージ: Homebrew ([bootstrap リポジトリ](https://github.com/syou910/bootstrap) の Brewfile)

## GitHub 操作の使い分け

- GitHub の情報を **readonly で取得するときは `ghro` コマンドを使う** (issue/PR/コミット一覧、ファイル内容の取得など)
  - ファイル内容を取得するとき Fetch/WebFetch を使わず `ghro api` を使う
- 書き込み操作 (issue 作成、PR マージ、push 等) は通常の `gh` / `git` コマンドを使う
- `ghro` は書き込み不可のトークンで動くため、書き込みに使わないこと
