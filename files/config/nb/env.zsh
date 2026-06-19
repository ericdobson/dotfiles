#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

export NB_DIR="$XDG_DATA_HOME/nb"
export NBRC_PATH="$XDG_CONFIG_HOME/nb/nbrc"
