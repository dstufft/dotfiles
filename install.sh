#!/bin/bash
set -euxo pipefail

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

echo "DOTFILES_DIR=$DOTFILES_DIR" > ~/.zshenv
echo '. $DOTFILES_DIR/zsh/.zshenv' >> ~/.zshenv
