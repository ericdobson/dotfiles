#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

batmd() {
  fold -sw 80 -- "$1" | command bat -l markdown
}
