#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

# source generated key bindings, completions, or other interactive shell init
if [[ -r "$XDG_CONFIG_HOME/tinted-theming/tinty/tinty-zsh-completion.sh" ]]; then
  source "$XDG_CONFIG_HOME/tinted-theming/tinty/tinty-zsh-completion.sh"
fi
