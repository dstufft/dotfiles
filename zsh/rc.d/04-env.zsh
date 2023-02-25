#!/bin/zsh

##
# Environment variables
#

# Detect what platform we're on, and set our platform var
if grep -qs microsoft /proc/sys/kernel/osrelease; then
    local platform="windows-wsl"
elif [[ `uname` == "Darwin" ]]; then
    local platform="macos"
fi

if [[ $platform == "windows-wsl" ]]; then
    # Setup our Homebrew environments
    export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

    # Force certain more-secure behaviours from homebrew
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha
elif [[ $platform == "macos" ]]; then
    # Setup our Homebrew environments
    export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"
    export HOMEBREW_PREFIX="/opt/homebrew"

    # Force certain more-secure behaviours from homebrew
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha
fi

# Setup our PATH, and FPATH
# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    ~/.local/bin
    "$HOMEBREW_PREFIX/bin"
    "$HOMEBREW_PREFIX/sbin"
    $path
)

fpath=(
    "$HOMEBREW_PREFIX/share/zsh/site-functions"
    $fpath
)

manpath=(
    "$HOMEBREW_PREFIX/share/man"
    $manpath
)

infopath=(
    "$HOMEBREW_PREFIX/share/info"
    $infopath
)


# Add any platform specific paths
if [[ $platform == "windows-wsl" ]]; then
    path+=( /mnt/c/WSLBin )
fi

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path
export -U FPATH fpath
export -U MANPATH manpath
export -U INFOPATH infopath
