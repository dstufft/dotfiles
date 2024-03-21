#!/bin/bash
set -euxo pipefail

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

# Setup zsh
echo "DOTFILES_DIR=$DOTFILES_DIR" > ~/.zshenv
echo '. $DOTFILES_DIR/zsh/.zshenv' >> ~/.zshenv

# Link dotfiles
ln -sf $DOTFILES_DIR/.tool-versions ~/.tool-versions

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Tap Homebrew core
/home/linuxbrew/.linuxbrew/bin/brew tap homebrew/core --force

# Install Homebrew Deps
/home/linuxbrew/.linuxbrew/bin/brew bundle --file $DOTFILES_DIR/Brewfile
