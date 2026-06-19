#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

codex() {
  : "${CODEX_HOME:?CODEX_HOME must be set}"
  command op run --env-file "$CODEX_HOME/codex.env" -- command codex "$@"
}

alias lc="/Users/eric/.local/bin/launch_codex"
