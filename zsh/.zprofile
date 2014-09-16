#!/usr/bin/env zsh

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi


# If pyenv is present, configure it for use
if which pyenv &> /dev/null; then
    PYTHON_CONFIGURE_OPTS='--enable-unicode=ucs4 --with-wide-unicode --enable-ipv6 --enable-loadable-sqlite-extensions --with-computed-gotos'
    PYTHON_CFLAGS='-O3 -g -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security'

    eval "$(pyenv init -)";
fi

# Look for all of the files in our rc directory and source them. This allows us
# to split up the configuration without having to manually specify every single
# RC file.
for rcfile in ${ZDOTDIR-~}/profile/*(.); do
    source $rcfile
done
