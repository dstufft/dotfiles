#!/bin/bash
set -euxo pipefail

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

# Setup zsh
echo "DOTFILES_DIR=$DOTFILES_DIR" > ~/.zshenv
echo '. $DOTFILES_DIR/zsh/.zshenv' >> ~/.zshenv

# Install Homebrew
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
