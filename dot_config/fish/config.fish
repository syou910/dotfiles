if status is-interactive
    # ssh-agent
    if not set -q SSH_AUTH_SOCK; or not ssh-add -l >/dev/null 2>&1
        eval (ssh-agent -c) >/dev/null
    end
    ssh-add --apple-use-keychain ~/.ssh/github 2>/dev/null
end

## Homebrew
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin

## flutter
fish_add_path /opt/flutter/bin

## pipx
fish_add_path ~/.local/bin

## anyenv
anyenv init - fish | source

## autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

## fzf
fzf --fish | source
