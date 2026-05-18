#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment variables.
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

if [ -d /opt/homebrew/opt/rustup/bin ]; then
    path=(/opt/homebrew/opt/rustup/bin $path)
fi

path=($CARGO_HOME/bin $path)
