#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

# Set up fzf key bindings and fuzzy completion
if [[ -o interactive ]] && [[ -t 0 ]] && (( $+commands[fzf] )); then
  # fzf 0.73's Ctrl-R widget enables --multi by default. Force single-select so
  # the Enter handler below executes exactly one history entry.
  [[ " $FZF_CTRL_R_OPTS " == *" --no-multi "* ]] ||
    FZF_CTRL_R_OPTS="${FZF_CTRL_R_OPTS:+$FZF_CTRL_R_OPTS }--no-multi"

  source <(fzf --zsh)

  fzf-history-widget-accept-line() {
    fzf-history-widget
    local ret=$?

    if (( ret == 0 )) && [[ -n "$BUFFER" ]]; then
      zle accept-line
    fi

    return $ret
  }

  zle -N fzf-history-widget-accept-line
  bindkey -M emacs '^R' fzf-history-widget-accept-line
  bindkey -M viins '^R' fzf-history-widget-accept-line
  bindkey -M vicmd '^R' fzf-history-widget-accept-line
fi
