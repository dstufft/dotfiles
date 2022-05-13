# ~/.zshenv should only be a one-liner that sources this file
# echo ". ~/projects/settings/zsh/.zshenv" > ~/.zshenv

# Disable the global compinit, we'll call it ourselves later
skip_global_compinit=1

# Set our dot directory to use our settings directory.
export ZDOTDIR=$HOME/projects/settings/zsh
