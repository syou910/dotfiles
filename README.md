# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している macOS の設定ファイルです。

## 管理対象

| パス | 内容 |
|---|---|
| `~/.config/fish/` | fish シェル設定 (pure プロンプト + Iceberg 配色) |
| `~/.config/ghostty/config` | Ghostty ターミナル設定 |
| `~/.config/opencode/tui.json` | OpenCode キーバインド |
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
