#!/usr/bin/env zsh

#
# User configuration sourced by interactive shells
#
DEFAULT_USER=dstufft

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
