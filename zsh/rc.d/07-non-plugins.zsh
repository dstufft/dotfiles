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
