#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.

# source generated key bindings, completions, or other interactive shell init
if [[ -r "$XDG_CONFIG_HOME/tinted-theming/tinty/tinty-zsh-completion.sh" ]]; then
  source "$XDG_CONFIG_HOME/tinted-theming/tinty/tinty-zsh-completion.sh"
fi

tinty_source_shell_themes() {
  local tinty_data_dir script

  tinty_data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/tinted-theming/tinty"

  for script in "$tinty_data_dir"/*.sh(N); do
    source "$script"
  done
}

if (( $+commands[tinty] )); then
  command tinty init >/dev/null && tinty_source_shell_themes

  tinty() {
    local subcommand status

    subcommand="$1"

    command tinty "$@"
    status=$?

    if (( status == 0 )) && [[ "$subcommand" == apply || "$subcommand" == init ]]; then
      tinty_source_shell_themes
    fi

    return "$status"
  }
fi
