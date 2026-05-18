#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment variables.
# history
export LESSHISTFILE="$XDG_STATE_HOME/less/lesshst"

# syntax highlighting
if lesspipe="$(command -v src-hilite-lesspipe.sh 2>/dev/null)"; then
  export LESSOPEN="| $lesspipe %s"
fi
export LESS=' -R -X -F '
# man page colors
export LESS_TERMCAP_mb=$'\e[6m'          # begin blinking (ever used?)
export LESS_TERMCAP_md=$'\e[2;33m'       # begin bold
export LESS_TERMCAP_us=$'\e[2;31m'       # begin underline
export LESS_TERMCAP_so=$'\e[1;33;41m'    # begin standout-mode - info box (ever used?)
export LESS_TERMCAP_me=$'\e[m'           # end mode
export LESS_TERMCAP_ue=$'\e[m'           # end underline
export LESS_TERMCAP_se=$'\e[m'           # end standout-mode
