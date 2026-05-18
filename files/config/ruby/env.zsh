#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment variables.
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
    path=(/opt/homebrew/opt/ruby/bin $path)
fi
