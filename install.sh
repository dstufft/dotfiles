#!/usr/bin/env zsh

# First we need to setout out ZDOTDIR, which is done by the .zshenv file.
source ${HOME}/.dotfiles/zsh/.zshenv

# THen we need to install the latest version of zim.
if [[ ! -e ${ZDOTDIR:-${HOME}}/.zim ]]; then
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
fi

# Then we're going to symlink our .zshenv into it's real location, that way our
# ZSH shells point to the correct directory.
ln -sf ${HOME}/.dotfiles/zsh/.zshenv ${HOME}

# Symlink in our git and hg configuration
ln -sfFh ${HOME}/.dotfiles/git ${HOME}/.config/git
ln -sf ${HOME}/.dotfiles/hg/hgrc ${HOME}/.hgrc
