#!/usr/bin/env zsh

# Set our $DEFAULT_USER, this is used to determine if the username needs to
# be added to the PROMPT or not.
DEFAULT_USER='dstufft'

# Disable the default virtualenv prompt since we have our own.
VIRTUAL_ENV_DISABLE_PROMPT='true'

# Look for all of the files in our rc directory and source them. This allows us
# to split up the configuration without having to manually specify every single
# RC file.
for rcfile in ${ZDOTDIR-~}/rc/*(.); do
    source $rcfile
done
