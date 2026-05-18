# codex

Repo-managed Codex configuration lives here.

`AGENTS.md` in this directory doubles as the global/user Codex instructions file, so keep it limited to rules you want applied everywhere. Repo-local `AGENTS.md` files above or below this path still apply when working inside this repo according to normal scope and precedence.

Included on purpose:

- `config.toml`, `codex.env`, `AGENTS.md`
- `agent_tooling/` for shared Ruby-backed global skill tooling and tests
- `rules/`
- `memories/`, even though it is currently empty, so any future Codex use of that directory shows up in `git status` and can be evaluated deliberately

Repo-local Codex skills belong under `.agents/skills/` at the repo root, not in
this user-global Codex config directory.
