# Project Operating Rules

This project uses Project Mode as a lightweight operating system for a solo builder.

## Project Commands

- Install:
- Dev server:
- Test:
- Lint:
- Build:
- Ship:

## Project Guardrails

- Do not overwrite user changes.
- Prefer existing project patterns.
- Keep scope small unless the user explicitly asks to expand it.
- Record important decisions in `.project-mode/decisions.md`.
- For guided and deep tasks, update `.project-mode/board.json`.
- Leave a checkpoint and resume note when pausing broad work.

## Workflow Modes

- Fast Track: under 10 minutes, low risk, direct execution.
- Guided Flow: default mode for most features, bugfixes, and scoped improvements.
- Deep Flow: use for cross-cutting changes, migrations, or work that needs checkpoints and stronger verification.

## Verification Defaults

- Run the smallest meaningful automated checks.
- For UI work, verify in the browser when practical.
- For medium and high-risk changes, do a second pass looking for regressions, missed files, and invalid assumptions.

## Pause And Resume

- Broad work should leave the repo in a resumable state.
- Update the board with blockers, checkpoint, and next step before stopping.
