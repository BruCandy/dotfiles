#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -f https://zed.dev/install.sh | sh

mkdir -p ~/.config/zed

cp "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
cp "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/settings.json"
