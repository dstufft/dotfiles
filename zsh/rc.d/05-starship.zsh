#!/bin/zsh

# Setup where our starship config can be found at
export STARSHIP_CONFIG="$settingsdir/starship/starship.toml"

# Setup our prompt to use starship
znap eval starship 'starship init zsh --print-full-init'
znap prompt
