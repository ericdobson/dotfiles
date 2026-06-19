#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

# 1Password manages plugins.sh directly, so keep this wrapper stable.
if [[ -r "$XDG_CONFIG_HOME/op/plugins.sh" ]]; then
  source "$XDG_CONFIG_HOME/op/plugins.sh"
fi
