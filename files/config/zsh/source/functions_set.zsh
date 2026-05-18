#!/usr/bin/env zsh

function zcompile-many() {
  local f
    for f; do zcompile -R -- "$f".zwc "$f"; done
}
