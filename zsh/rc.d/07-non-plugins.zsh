#!/bin/zsh
##
# Non Plugins
#

# direnv
znap eval direnv 'direnv hook zsh'

# pipx Python
znap eval pipx 'echo export PIPX_DEFAULT_PYTHON=$(asdf which python)'

# aws-vault
if [[ $platform == "windows-wsl" ]]; then
    export AWS_VAULT_BACKEND=pass
    export GPG_TTY=$(tty)
fi

# Setup CC to use Homebrew when we're runninder under WSL
if [[ $platform == "windows-wsl" ]]; then
    znap eval cc "echo export CC=$(brew --prefix)/bin/gcc-$(brew info --json=v1 gcc | jq -rj '.[0].linked_keg | split(".")[0]')"
fi

# cargo / rustup
. "$HOME/.cargo/env"

# git-machete aliases
alias gms='git machete status --list-commits-with-hashes'
alias gmt='git machete traverse --list-commits --fetch'
alias ggo='git machete go'
alias gma='git machete add'
alias gmd='git machete slide-out --delete'
alias gpr='git machete github create-pr'
alias gml='gll $(git machete fork-point)..'
