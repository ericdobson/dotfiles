#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment variables.
# Keep setup cheap and deterministic: no prompt logic, widgets, completions,
# network access, git operations, or expensive command substitutions.

# app-owned XDG locations
# export APP_CONFIG_HOME="$XDG_CONFIG_HOME/<app>"
# export APP_DATA_HOME="$XDG_DATA_HOME/<app>"
# export APP_STATE_HOME="$XDG_STATE_HOME/<app>"

# app config and state files
# export APP_CONFIG="$XDG_CONFIG_HOME/<app>/<app>.toml"
# export APP_CONFIG_PATH="$XDG_CONFIG_HOME/<app>/<app>rc"
# export APP_HISTFILE="$XDG_STATE_HOME/<app>/history"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_PAGER=""
export AWS_CLI_HISTORY_FILE="$XDG_STATE_HOME/aws/cli/history/history.db"

# app flags
# export APP_NO_ENV_HINTS=1
# export APP_ECHO=1

# literal secret references are okay here; do not run the secret manager in zshenv
# export APP_API_TOKEN="op://Vault/item/field"

# optional Homebrew-provided binaries
# if [ -d "/opt/homebrew/opt/<formula>/bin" ]; then
#   path=(/opt/homebrew/opt/<formula>/bin $path)
# fi

# app-owned binary directories
# export APP_HOME="$XDG_DATA_HOME/<app>"
# path=("$APP_HOME/bin" $path)

# cheap helper discovery, when the variable genuinely needs an absolute command
# if app_helper="$(command -v <helper> 2>/dev/null)"; then
#   export APP_OPEN="| $app_helper %s"
# fi

# terminal escape configuration
# export APP_TERMCAP_md=$'\e[2;33m'
# export APP_TERMCAP_me=$'\e[m'
