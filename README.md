# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している macOS の設定ファイルです。

## 管理対象

| パス | 内容 |
|---|---|
| `~/.config/fish/` | fish シェル設定 (pure プロンプト + Iceberg 配色) |
| `~/.config/ghostty/config` | Ghostty ターミナル設定 |
| `~/.config/opencode/tui.json` | OpenCode キーバインド |
| `~/.colima/default/colima.yaml` | Colima の VM 設定 |
| `~/.gemini/antigravity-cli/settings.json` | Antigravity CLI の実行モード・権限設定 |
| `~/.gitconfig` | git 設定 (delta 連携) |
| `~/.ssh/config` | SSH 設定 |

## セットアップ

新規マシンでは [bootstrap リポジトリ](https://github.com/syou910/bootstrap) の `setup.sh` が
本リポジトリを含めすべて復元します。

## 使い方

```sh
# 設定を編集して即時反映
chezmoi edit ~/.config/fish/config.fish
chezmoi apply

# ソースディレクトリ (~/.local/share/chezmoi) で直接編集した場合
chezmoi apply

# 変更の確認
chezmoi diff

# 他マシンへはコミット & プッシュ後、各マシンで
chezmoi update   # git pull + apply
```

## 構成

`.chezmoiroot` ファイルにより、実際のファイル群は `home/` 配下に配置しています。
ソース内のパスは chezmoi の命名規則に従います (例: `.config` → `dot_config`)。

## Antigravity CLI の自動実行

`agentMode: auto` で編集・安全なコマンドを自動実行し、リスクの高い操作は確認します。
`enableTerminalSandbox: true` と `allowNonWorkspaceAccess: false` を設定し、
ワークスペース外へのアクセスを無条件には許可しません。
`toolPermission: proceed-in-sandbox` は Auto モード以外でもサンドボックス内だけ自動実行し、
外での実行は確認するための設定です。

個別コマンドの恒久許可は持たず、`permissions.allow` は空にします。
確認時はその都度の許可を使い、具体的なブランチ名・パスを含む許可を設定へ保存しない運用にします。
`--dangerously-skip-permissions` は使用しません。
Auto モードの安全性判定とサンドボックスは、ワークスペース内のデータ破壊を完全に防ぐものではありません。

仕様: [実行モードと権限](https://antigravity.google/docs/permissions)、
[ターミナルサンドボックス](https://antigravity.google/docs/sandbox)。
