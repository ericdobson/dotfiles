---
name: update-prompt
description: Review and rewrite temporary prompt files so they are ready to paste into a fresh Codex thread. Use when the user asks to update temp_prompt.md, update the temp prompt, prepare temp_prompt.md, prepare the temp prompt, or otherwise make a temporary prompt paste-ready for a new Codex conversation.
---

# Update Prompt

## Workflow

Review the target temp prompt and update it so it is ready to paste into a fresh Codex thread.

1. Locate the requested file. If the user says "temp prompt" without a path, prefer `temp_prompt.md` in the current workspace.
2. Read the whole prompt before editing.
3. Rewrite the prompt for a fresh Codex thread:
   - Preserve the user's intended goal, constraints, repo context, and required outputs.
   - Remove stale conversation references, progress narration, duplicated context, and text that only made sense in the old thread.
   - Make the prompt self-contained enough that a new Codex thread can act on it without prior chat history.
   - Keep instructions concrete, concise, and directly actionable.
4. Edit the file in place.
5. Briefly report what changed and note the file path.
