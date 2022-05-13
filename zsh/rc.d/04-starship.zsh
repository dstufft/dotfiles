#!/bin/zsh

# Setup where our starship config can be found at
export STARSHIP_CONFIG="$settingsdir/starship/starship.toml"

# Download starship, if it's not there yet.
if [ ! -f $HOME/.local/bin/starship ]; then
    mkdir -p ~/.local/bin
    curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin --yes
    rehash
fi

# Setup our prompt to use starship
znap eval starship 'starship init zsh --print-full-init'
znap prompt
