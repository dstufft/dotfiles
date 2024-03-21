#!/bin/zsh

local znap=$DOTFILES_DIR/zsh/repos/zsh-snap/znap.zsh

# Download Znap, if it's not there yet.
if ! [[ -r $znap ]]; then
    local znapdir=$(dirname $znap)

    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $znapdir
fi

zstyle ':znap:*' repos-dir $DOTFILES_DIR/zsh/repos
. $znap     # Load Znap.
