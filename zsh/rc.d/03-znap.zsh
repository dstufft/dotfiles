#!/bin/zsh

local znap=$settingsdir/zsh/zsh-snap/znap.zsh

# Download Znap, if it's not there yet.
if ! [[ -r $znap ]]; then
    local znapdir=$(dirname $znap)

    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $znapdir
fi

# zstyle ':znap:*' repos-dir ~/.config/zsh
. $znap     # Load Znap.
