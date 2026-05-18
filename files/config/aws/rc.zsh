#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

# aliases for frequent commands
# alias appc="$VISUAL $XDG_CONFIG_HOME/<app>/<app>.conf"
# alias appd="cd $XDG_CONFIG_HOME/<app>; eza -al"
# alias app-status="app status"

# command replacement aliases
# alias oldapp="newapp"

# small formatting helpers
# appmd() {
#   fold -sw 80 -- "$1" | command app -l markdown
# }

# wrappers should use command to avoid recursively calling themselves
aws() {
  if ! (( $+commands[aws] )); then
    print -u2 -- "aws: command not found"
    return 127
  fi

  case "${1:-}" in
    ""|sso|configure|help|--help|-h|--version)
      command aws "$@"
      return $?
      ;;
  esac

  if ! command aws sts get-caller-identity >/dev/null 2>&1; then
    print -u2 -- "AWS SSO session expired or unavailable. Running: aws sso login"
    command aws sso login || return $?
  fi

  command aws "$@"
}

# wrappers can require env variables exported from env.zsh
# app_with_config() {
#   : "${APP_HOME:?APP_HOME must be set}"
#   command app --config "$APP_HOME/config" "$@"
# }

# wrappers can run a command with an app-owned env file
# app_with_secrets() {
#   : "${APP_HOME:?APP_HOME must be set}"
#   op run --env-file "$APP_HOME/app.env" -- command app "$@"
# }

# cwd-changing helpers should clean up temp files
# app_cd() {
#   local tmp="$(mktemp -t "app-cwd.XXXXXX")" cwd
#   command app "$@" --cwd-file="$tmp"
#   IFS= read -r -d '' cwd < "$tmp"
#   [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
#   rm -f -- "$tmp"
# }

# source app-managed interactive files
# source "$XDG_CONFIG_HOME/<app>/plugins.sh"

# source generated key bindings, completions, or other interactive shell init
# source <(<app> --zsh)
