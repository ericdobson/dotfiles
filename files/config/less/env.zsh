#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

# syntax highlighting
if src_hilite_lesspipe="$(command -v src-hilite-lesspipe.sh 2>/dev/null)"; then
  export LESSOPEN="| $src_hilite_lesspipe %s"
fi

# man page colors
export LESS_TERMCAP_md=$'\e[1;33m'   # bold yellow
export LESS_TERMCAP_us=$'\e[4;34m'   # underlined blue
export LESS_TERMCAP_so=$'\e[7m'      # reverse-video standout
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
