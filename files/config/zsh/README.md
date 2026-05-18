# Zsh

This directory holds the repo-managed zsh startup files. The layout is
intentional: keep core shell startup state close to `zshenv`, keep interactive
behavior in `zshrc`, and keep one-off login cleanup in `zlogin`.

## Startup Files

### `zshenv`

Runs for every zsh process.

Responsibilities:
- define XDG directories
- set `ZDOTDIR`
- define an explicit baseline `PATH`
- set generic editor and terminfo environment variables
- source app-specific environment snippets from `home/config/<app>/env.zsh`

Rules:
- keep it cheap, deterministic, and environment-only
- do not add network work, prompt setup, completion setup, or expensive command
  discovery here

### `zprofile`

Currently unused. Reserve it for login-session setup if a future change needs
that scope specifically.

### `zshrc`

Runs for interactive shells.

Responsibilities:
- aliases and helper functions
- interactive shell options
- history and directory-stack behavior
- completion setup
- source app-specific interactive snippets from `home/config/<app>/rc.zsh`
- prompt initialization
- interactive plugin loading
- interactive-only terminal state such as `GPG_TTY`

### `zlogin`

Runs for login shells after `zshrc`.

Responsibilities:
- fire small standalone helper scripts from `~/.local/bin/zlogin_scripts`
- keep those helpers isolated from normal startup config via `zsh -f`

### `zlogout`

Currently unused.

## App-Specific Environment Files

Environment owned by a specific tool or app should usually live in that app's
config directory as `env.zsh`, then be sourced from `zshenv`.

Examples:
- `home/config/codex/env.zsh`
- `home/config/homebrew/env.zsh`
- `home/config/less/env.zsh`
- `home/config/starship/env.zsh`

Rules for `env.zsh` files:
- environment variables only
- no aliases, functions, prompt code, completions, or plugin loading
- no network access
- no expensive shell-outs during startup

Note:
- `home/config/gnupg` is an acceptable variation because it is a symlinked view
  onto `home/local/share/gnupg`, so its `env.zsh` lives there rather than in a
  plain repo directory under `home/config/`

## App-Specific Interactive Files

Interactive shell behavior owned by a specific tool or app should usually live
in that app's config directory as `rc.zsh`, then be sourced from `zshrc`.

Examples:
- `home/config/codex/rc.zsh`
- `home/config/git/rc.zsh`
- `home/config/homebrew/rc.zsh`
- `home/config/kitty/rc.zsh`
- `home/config/op/rc.zsh`
- `home/config/vim/rc.zsh`

Rules for `rc.zsh` files:
- interactive shell behavior only
- good fits include aliases, wrappers, and app-specific shell integration
- no network work during shell startup
- no expensive startup logic unless there is a concrete reason

Note:
- `home/config/op/plugins.sh` is an acceptable variation because 1Password
  expects that exact file path and may manage it directly.
  `home/config/op/rc.zsh` remains the repo-owned wrapper that `zshrc` sources.

## Plugin Management

Interactive zsh plugins are installed outside startup and only loaded from
startup.

- `home/local/bin/manage_zsh_plugins sync` installs the pinned plugin refs into
  `$XDG_DATA_HOME/zsh/plugins`
- `home/local/bin/manage_zsh_plugins check` compares the pinned refs to current
  upstream stable tags
- `home/config/zsh/source/plugins.zsh` only loads installed plugin entrypoints;
  it does not clone or update anything

Current intent:
- plugin installation belongs to bootstrap or an explicit maintenance command
- shell startup should not hit the network

## References

- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
- [ArchWiki XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory)
