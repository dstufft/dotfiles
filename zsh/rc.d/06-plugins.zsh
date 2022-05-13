#!/bin/zsh
##
# Plugins
#

# Add the plugins you want to use here.
# For more info on each plugin, visit its repo at github.com/<plugin>
# -a sets the variable's type to array.
local -a plugins=(
    zsh-users/zsh-autosuggestions # Real-time type-ahead completion
    ellie/atuin                   # Replace history with an SQLite database w/ syncing
    birdhackor/zsh-exa-ls-plugin  # Use exa instead of ls and tree
    ajeetdsouza/zoxide            # Use zoxide as z
    zdharma-continuum/fast-syntax-highlighting  # Enable Syntax highlighting
)


# Speed up the first startup by cloning all plugins in parallel.
# This won't clone plugins that we already have.
znap clone $plugins

# Load each plugin, one at a time.
local p=
for p in $plugins; do
  znap source $p
done
