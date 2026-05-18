# 1Password CLI

This directory contains 1Password CLI configuration and the shell glue needed
to fit it into the repo's zsh layout.

## Shell Files

### `plugins.sh`

This file is managed by 1Password.

- 1Password looks for this exact path and may update it directly.
- Do not rename it to fit the repo's general `rc.zsh` pattern.
- Keep its contents under 1Password's control.

### `rc.zsh`

This file is repo-managed and is sourced from `home/config/zsh/zshrc`.

- Its current purpose is to source `plugins.sh`.
- Keep it as the stable integration point that matches the repo's `home/config/<app>/rc.zsh` structure.
- If more interactive 1Password-specific shell behavior is added later, put it here rather than modifying `zshrc` directly.
