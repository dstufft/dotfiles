#!/bin/zsh

##
# Shell options that don't fit in any other file.
#
# Set these after sourcing plugins, because those might set options, too.
#

# Use zoxide for our recent directories
zstyle ':autocomplete:*' recent-dirs zoxide

# Setup autosuggest to use history then completion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
