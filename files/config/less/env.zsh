#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.

# history
export LESSHISTFILE="$XDG_STATE_HOME/less/lesshst"

# syntax highlighting
if src_hilite_lesspipe="$(command -v src-hilite-lesspipe.sh 2>/dev/null)"; then
  export LESSOPEN="| $src_hilite_lesspipe %s"
fi

# default command flags
export LESS=' -R -X -F '

# man page colors
export LESS_TERMCAP_mb=$'\e[6m'          # begin blinking (ever used?)
export LESS_TERMCAP_md=$'\e[1;33m'       # begin bold
export LESS_TERMCAP_us=$'\e[4;34m'       # begin underline
export LESS_TERMCAP_so=$'\e[1;30;43m'    # begin standout-mode
export LESS_TERMCAP_me=$'\e[m'           # end mode
export LESS_TERMCAP_ue=$'\e[m'           # end underline
export LESS_TERMCAP_se=$'\e[m'           # end standout-mode
