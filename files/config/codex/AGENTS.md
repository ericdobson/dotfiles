# AGENTS.md

## git

- Unless explicitly instructed differently by the user, leave all changes unstaged.
- For GitHub remotes on `github.com`, use SSH URLs by default: `git@github.com:OWNER/REPO.git`.
- Do not add `https://github.com/...` Git remotes unless I explicitly request HTTPS.
- If an existing repo has a `https://github.com/...` remote and a Git network operation is needed, convert that remote to the equivalent SSH URL automatically before continuing.
- Ask before changing remotes only when the remote is not on `github.com`, the URL is unusual or ambiguous, the URL contains embedded credentials, or the change would alter more than the transport.

## github

- Always prefer the GitHub MCP server over `gh`.
- If the GitHub MCP server fails due to a permissions error, stop work and output the required permissions so I can adjust the token.
- If a specific task is not possible via the GitHub MCP server, fall back to `gh` only when the failure is a capability gap, not a missing-server or permissions problem.
- Do not create pull requests unless explicitly instructed. "Push" means push commits to the remote branch, not push and open a pull request.
