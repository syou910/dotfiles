# Global instructions

## GitHub 操作の使い分け

- GitHub の情報を **readonly で取得するときは `ghro` コマンドを使う** (issue/PR/コミット一覧、ファイル内容の取得など)
  - ファイル内容を取得するとき Fetch を使わず `ghro api` を使うこと
- 書き込み操作 (issue 作成、PR マージ等) は通常の `gh` コマンドを使う
- `ghro` は書き込み不可のトークンで動くため、書き込みに使わないこと
