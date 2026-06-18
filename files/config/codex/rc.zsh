#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
codex() {
  : "${CODEX_HOME:?CODEX_HOME must be set}"
  op run --env-file "$CODEX_HOME/codex.env" -- command codex "$@"
}

alias lc="/Users/eric/.local/bin/launch_codex"
