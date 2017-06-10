#!/usr/bin/env zsh

# Set default user
DEFAULT_USER=dstufft

# Set named directories
p=~/projects
: ~p

# If pyenv is present, configure it for use
if which pyenv &> /dev/null; then
    PYTHON_CONFIGURE_OPTS='--enable-unicode=ucs4 --with-wide-unicode --enable-ipv6 --enable-loadable-sqlite-extensions --with-computed-gotos'
    PYTHON_CFLAGS='-O3 -g -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security'

    eval "$(pyenv init -)";

    # We have pyenv, so use it to determine where our virtualenvwrapper.sh is
    WRAPPER_SCRIPT=`pyenv which virtualenvwrapper.sh`
else
    # We don't have pyenv, so use the normal which
    WRAPPER_SCRIPT=`which virtualenvwrapper.sh`
fi

if [ -e "$WRAPPER_SCRIPT" ]; then
    # Define our location for where our virtual environments will be stored.
    WORKON_HOME=~/.virtualenvs

    # Define a named directory for virtualenvs
    v=$WORKON_HOME
    : ~v

    # Source the virtualenvwrapper script
    source "$WRAPPER_SCRIPT"

    # Define a zshexit function which will ensure that a temporary virtualenv
    # is deactivated before we exit the shell.
    zshexit() {
        if [[ -n $VIRTUAL_ENV && "$(basename $VIRTUAL_ENV)" =~ '^tmp-.+$' ]]; then
            deactivate
        fi
    }
fi

#clean up the namespace slightly by removing the checker function
unset -v WRAPPER_SCRIPT

# Always use smart case for rg
alias rg='rg --smart-case'

# Add our user bin
PATH="$HOME/.local/bin:$PATH"

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Set a color for autosuggestion so that we can actually see it with my regular
# theme.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"
