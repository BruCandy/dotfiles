#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -f https://zed.dev/install.sh | sh

mkdir -p "$HOME/.config/zed"

cp "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
cp "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/keymap.json"


BASHRC="$HOME/.bashrc"

if ! grep -q "show_last_status()" "$BASHRC"; then
    cat >> "$BASHRC" <<'EOF'

# Show previous command failure status
show_last_status() {
    local exit_code=$?

    if [ "$exit_code" -ne 0 ]; then
        echo -e "\e[31mfailed: exit $exit_code\e[0m"
    fi
}

PROMPT_COMMAND=show_last_status
EOF
fi
