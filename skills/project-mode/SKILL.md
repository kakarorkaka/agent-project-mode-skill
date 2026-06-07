---
name: project-mode
description: Use when the user wants an AI coding agent such as Codex or Claude Code to run a repository with a lightweight solo-builder project workflow, including phrases like 启用项目模式, Project Mode, project mode, 正式需求, 任务看板, Fast Track, deep task, design review, checkpoint, acceptance criteria, resume work, or project patrol. Provides work modes, repo-native state files, lightweight execution gates, verification, and pause/resume discipline.
metadata:
  short-description: Lightweight project workflow for solo builders
---

# Project Mode

Run the current coding agent as a disciplined solo builder. Use work modes instead of personas, project files as memory, and lightweight gates only when they add real value.

## Core Model

- One developer can still benefit from multiple work modes.
- Use these labels as modes, not characters:
  - **Planner**: clarify scope, split work, set priority, define acceptance.
  - **Designer**: user flow, UI/UX details, copy, design review.
  - **Builder**: technical plan, implementation, self-test.
  - **Verifier**: test scope, challenge assumptions, look for regressions and missed files.
  - **Shipper**: deployment, health checks, rollback notes.
- If the project already uses older labels such as PM, PD, Dev, QA, and Ops, treat them as aliases for the modes above.

Speak to the user as one collaborator. Use mode labels only in artifacts or when phase transitions benefit from clarity.

## First Step In A Project

When the user says "启用项目模式", "use Project Mode", "project mode", or similar:

1. Check whether `.project-mode/`, `AGENTS.md`, and `CLAUDE.md` exist.
2. If absent, initialize them from `assets/` templates or run `scripts/init-project-mode.sh`.
3. Read `AGENTS.md`, `.project-mode/project.md`, `.project-mode/board.json`, and `.project-mode/decisions.md` if present.
4. Summarize current state and ask what work should enter the board.

## Routing

Use **Fast Track** when all are true:

- Estimated under 10 minutes.
- Touches one or two surfaces and has low risk.
- No new feature, route, database schema, API contract, auth or permission change, deployment, or architecture change.
- User wording is direct, such as "快速处理", "帮我改下", "看一下", "查一下".

Fast Track: execute directly, record a compact entry in `.project-mode/board.json` if the project uses the board, then report the result.

Use **Guided Flow** by default for scoped features, bugfixes, and product work that benefits from lightweight planning.

Guided Flow:

1. Restate the request.
2. Identify assumptions, open questions, and risk level.
3. Propose task slices, acceptance criteria, and verification plan.
4. Ask for explicit approval only when ambiguity or risk is meaningful.
5. Update `.project-mode/board.json` and execute.

Use **Deep Flow** for repo-wide changes, migrations, broad refactors, high-risk work, or anything likely to need checkpoints and stronger verification.

Deep Flow:

1. Restate the desired end state and the main risks.
2. Split the work into explicit workstreams and dependencies.
3. Decide what can be investigated or implemented independently.
4. Choose a verification strategy before editing.
5. Define a checkpoint and a resume note before or during long work.
6. Update `.project-mode/board.json` and execute in the smallest safe slices.

Do not upgrade work into Deep Flow just to feel more formal. Use the smallest workflow that still protects quality and clarity.

## Dynamic Principles

Borrow only the useful parts of dynamic execution while staying lightweight:

- **Complexity first**: before substantial work, judge scope, risk, surface area, and reversibility.
- **Decompose explicitly**: when a task is broad, split it into workstreams with dependencies.
- **Parallelize only when clean**: use parallel investigation only when results can be merged safely. Otherwise keep the workstreams explicit and execute them one by one.
- **Verify separately**: for medium and high-risk work, do a second-pass verification after implementation instead of relying on the build pass alone.
- **Leave checkpoints**: if work spans sessions, leave the next person, often yourself, a clear resume point.

## Execution Rules

- Before edits, say what will be changed and why.
- Prefer existing project patterns over new abstractions.
- Keep user-facing communication concise; the structure should make work easier, not heavier.
- For Guided Flow and Deep Flow, keep `.project-mode/board.json` updated enough that the task can be resumed later.
- Track workstreams, blockers, and the next safe resume step for broad tasks.
- For medium and high-risk work, run an explicit verification pass after implementation that looks for regressions, missed files, or invalid assumptions.
- After implementation, run available tests or explain why tests could not run.
- For frontend changes, start the local app when practical and verify visually with the browser.
- Never overwrite user changes. Work with dirty worktrees carefully.
- Record important decisions in `.project-mode/decisions.md`.
- If work pauses mid-stream, leave a checkpoint and resume note before handing off or stopping.

## Platform Notes

- **Codex**: use `AGENTS.md` as the shared project instruction file.
- **Claude Code**: use `CLAUDE.md` as the Claude-facing project memory file. The generated `CLAUDE.md` imports `AGENTS.md` so project rules stay in one place.
- Keep platform-specific setup in README files and scripts. Keep the workflow itself platform-neutral.

## State Files

- For schema and status rules, read `references/board-schema.md`.
- For project file meanings and templates, read `references/project-files.md`.
- For detailed mode handoffs, read `references/role-sop.md`.

## Useful Commands

Initialize a project from the installed skill directory:

```bash
~/.codex/skills/project-mode/scripts/init-project-mode.sh /path/to/project
```

For Claude Code personal skill installs:

```bash
~/.claude/skills/project-mode/scripts/init-project-mode.sh /path/to/project
```
