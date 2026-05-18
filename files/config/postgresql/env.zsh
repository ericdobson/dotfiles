#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment variables.
if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
    path=(/opt/homebrew/opt/libpq/bin $path)
fi
