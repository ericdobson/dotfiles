#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"

# do not print the matched directory
export _ZO_ECHO=0

# exclude from database
export _ZO_EXCLUDE_DIRS=$HOME:$HOME/.config/*

# resolve symlinks before adding to database
export _ZO_RESOLVE_SYMLINKS=1
