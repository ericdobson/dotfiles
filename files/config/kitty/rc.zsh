#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

alias kc="$VISUAL $XDG_CONFIG_HOME/kitty/kitty.conf"
alias kcd="cl; cd $XDG_CONFIG_HOME/kitty; eza -al"
