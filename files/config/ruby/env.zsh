#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

if [[ -d "/opt/homebrew/opt/ruby/bin" ]]; then
  path=(/opt/homebrew/opt/ruby/bin $path)
fi
