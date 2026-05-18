# AGENTS.md

## git

- Unless explicitly instructed differently by the user, leave all changes unstaged.
- For GitHub remotes on `github.com`, use SSH URLs by default: `git@github.com:OWNER/REPO.git`.
- Do not add `https://github.com/...` Git remotes unless I explicitly request HTTPS.
- If an existing repo has a `https://github.com/...` remote and a Git network operation is needed, convert that remote to the equivalent SSH URL automatically before continuing.
- Ask before changing remotes only when the remote is not on `github.com`, the URL is unusual or ambiguous, the URL contains embedded credentials, or the change would alter more than the transport.

## github

- Always prefer the correctly routed GitHub MCP server over `gh`.
- If the selected GitHub MCP server fails due to a permissions error, stop work and output the required permissions so I can adjust the token.
- If a specific task is not possible via the selected GitHub MCP server, fall back to `gh` only when the failure is a capability gap, not a missing-server or permissions problem. When using `gh`, select the token by repository owner using the `gh token routing` rules.
- Do not create pull requests unless explicitly instructed. "Push" means push commits to the remote branch, not push and open a pull request.

### GitHub MCP routing

- I have multiple GitHub MCP servers configured:
  - `github_personal`: use for repositories and resources owned by my `ericdobson` personal GitHub account.
  - `github_old_pro`: use for repositories and resources under the `old-pro-codeworks` organization.
- Choose the GitHub MCP server by repository owner:
  - `old-pro-codeworks/*` -> use the `github_old_pro` MCP server.
  - `ericdobson/*` -> use the `github_personal` MCP server.
- Before performing a GitHub MCP operation, determine the repository owner from the requested repo name, current git remote, issue/PR URL, or explicit user instruction, then select the matching MCP server.
- Never use `github_personal` for `old-pro-codeworks` organization resources.
- Never use `github_old_pro` for personal repositories unless I explicitly request it.
- If the required MCP server is not available in the active tool list, stop and tell me which server is missing. Do not fall back to another GitHub MCP server with different credentials.
- For repositories owned by any other GitHub account or organization, infer the intended MCP server from explicit context; if unclear, ask before using a GitHub MCP server.

### gh token routing

- Do not assume the ambient `GH_TOKEN` is valid for all GitHub owners.
- I may provide owner-specific tokens through environment variables:
  - `GH_TOKEN_PERSONAL`: use for `ericdobson/*`.
  - `GH_TOKEN_OLD_PRO`: use for `old-pro-codeworks/*`.
- When falling back to `gh`, choose the token by repository owner and pass it only for that command:
  - `GH_TOKEN="$GH_TOKEN_PERSONAL" gh ...` for `ericdobson/*`.
  - `GH_TOKEN="$GH_TOKEN_OLD_PRO" gh ...` for `old-pro-codeworks/*`.
- If the owner-specific token needed for a `gh` fallback is not available, stop and say which token variable is missing.
- Do not use a token for the wrong owner to probe permissions.
