#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
