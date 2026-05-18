#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.

# Set up fzf key bindings and fuzzy completion
if [[ -o interactive ]] && [[ -t 0 ]] && (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi
