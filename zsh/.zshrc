#!/bin/zsh
#
# This file, .zshrc, is sourced by zsh for each interactive shell session.

# The construct below is what Zsh calls an anonymous function; most other
# languages would call this a lambda or scope function. It gets called right
# away with the arguments provided and is then discarded.
# Here, it enables us to use scoped variables in our dotfiles.
() {
  # Load all of the files in rc.d that start with <number>- and end in .zsh
  # (n) sorts the results in numerical order.
  # <-> is an open-ended range. It matches any non-negative integer.
  # <1-> matches any integer >= 1. <-9> matches any integer <= 9.
  # <1-9> matches any integer that's >= 1 and <= 9.
  local file=
  for file in $ZDOTDIR/rc.d/<->-*.zsh(n); do
    . $file
  done
} "$@"
# $@ expands to all the arguments that were passed to the current context (in
# this case, to `zsh` itself).
# "Double quotes" ensures that empty arguments '' are preserved.
# It's a good practice to pass "$@" by default. You'd be surprised at all the
# bugs you avoid this way.
