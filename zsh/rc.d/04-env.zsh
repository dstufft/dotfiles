#!/bin/zsh

##
# Environment variables
#

# Detect what platform we're on, and set our platform var
if grep -q microsoft /proc/sys/kernel/osrelease; then
    local platform="windows-wsl"
fi

# Setup our PATH
# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    ~/.local/bin
    $path
)

# Add any platform specific paths
if [[ $platform == "windows-wsl" ]]; then
    path+=( /mnt/c/WSLBin )
fi

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path
