# files/config

This tree contains repo-managed XDG-style application configuration. In the
installed dotfiles layout, this directory is expected to correspond to
`$XDG_CONFIG_HOME`.

## `env.zsh` Files

Files named `env.zsh` are sourced from the zsh environment startup path,
usually from `files/config/zsh/zshenv`. They run for every zsh process, so keep
them cheap, deterministic, and independent of interactive shell state.

Use `env.zsh` files for:

- exported app config paths
- exported app data, state, and cache locations
- exported tool flags
- app-specific history and cache paths
- deterministic `path` additions
- cheap helper discovery only when an environment variable genuinely needs an
  absolute command path
- cheap terminal escape environment variables

Do not use `env.zsh` files for:

- aliases
- shell functions and command wrappers
- prompt setup
- shell completions
- key bindings
- plugin loading
- network calls
- git operations
- package manager operations
- secret-manager commands
- expensive command substitutions
- anything that assumes a TTY or interactive shell

Use the matching `rc.zsh` file for aliases, wrappers, completions, prompt
integration, and other interactive shell behavior.

Every `env.zsh` file should start with this boilerplate:

```zsh
#!/usr/bin/env zsh

# Sourced from zshenv. Keep this file limited to environment and PATH setup.
# Keep setup cheap and deterministic: no prompt logic, aliases, functions,
# widgets, completions, network access, git operations, secret-manager calls,
# or expensive command substitutions.
```

For optional path additions, prefer cheap filesystem checks:

```zsh
if [[ -d "/opt/homebrew/opt/tool/bin" ]]; then
  path=(/opt/homebrew/opt/tool/bin $path)
fi
```

When a variable genuinely needs an absolute helper command, cheap local
discovery is acceptable:

```zsh
if helper="$(command -v helper-name 2>/dev/null)"; then
  export TOOL_HELPER="$helper"
fi
```

Literal secret references are acceptable here when another tool resolves them
later, but do not run a secret manager from `zshenv`:

```zsh
export TOOL_API_TOKEN="op://Vault/item/field"
```

## `rc.zsh` Files

Files named `rc.zsh` are sourced from the interactive zsh startup path, usually
from `files/config/zsh/zshrc`. They are for app-specific interactive shell
behavior only.

Use `rc.zsh` files for:

- aliases
- shell functions and command wrappers
- shell completions
- key bindings
- interactive tool initialization

Do not use `rc.zsh` files for:

- `PATH` changes
- exported environment variables
- config path variables
- secrets, tokens, or credentials
- non-interactive defaults
- network calls during shell startup
- expensive startup checks unless there is a concrete reason

Use the matching `env.zsh` file for environment variables and other settings
that should exist outside interactive shells. For example, app config paths,
tool-specific environment variables, and path additions belong in `env.zsh`,
not `rc.zsh`.

Every `rc.zsh` file should start with this boilerplate:

```zsh
#!/usr/bin/env zsh

# Sourced from zshrc. Keep this file limited to interactive shell behavior.
# Keep network work and expensive startup logic out unless there is a concrete reason.
```

For optional tools that perform work while the shell starts, guard the setup:

```zsh
if [[ -o interactive ]] && [[ -t 0 ]] && (( $+commands[tool] )); then
  source <(tool --zsh)
fi
```

When sourcing generated or machine-managed files, check that they are readable:

```zsh
if [[ -r "$XDG_CONFIG_HOME/tool/generated.zsh" ]]; then
  source "$XDG_CONFIG_HOME/tool/generated.zsh"
fi
```

Wrappers that shadow commands should use `command` internally to avoid
recursing into themselves:

```zsh
tool() {
  command tool "$@"
}
```

Prefer aliases for simple command abbreviations:

```zsh
alias lg="lazygit"
```

Prefer functions for behavior:

```zsh
y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [[ "$cwd" != "$PWD" && -d "$cwd" ]] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
```
