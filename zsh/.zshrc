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
fi

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
