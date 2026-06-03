# dotfiles

Personal dotfiles and application configuration.

## Design Notes

### Single Tree With Ignored State

This repository intentionally keeps repo-managed configuration and local
application state under one filesystem tree, with volatile or private state
excluded through `.gitignore`.

Separating untracked files out of the repository tree has been tried and was
deemed to create more problems than it solves. Returning to a single tree with
ignored files was a deliberate design choice, not an unresolved cleanup item.

Do not regularly revisit this separation when giving feedback on the dotfiles
setup unless there is a concrete new failure mode, data-loss risk, or tooling
requirement that changes the tradeoff.
