#!/usr/bin/env zsh

typeset plugin_root autosuggestions syntax_highlighting

plugin_root="$XDG_DATA_HOME/zsh/plugins"
autosuggestions="$plugin_root/zsh-autosuggestions/zsh-autosuggestions.zsh"
syntax_highlighting="$plugin_root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

if [[ -r "$autosuggestions" ]]; then
  source "$autosuggestions"
fi

# zsh-syntax-highlighting should be sourced last, after prompt and widget setup.
if [[ -r "$syntax_highlighting" ]]; then
  source "$syntax_highlighting"
fi
