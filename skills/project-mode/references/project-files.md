# Project Files

Project Mode uses shared project instruction files and one state directory so project memory stays inside the repo.

## `AGENTS.md`

Shared project-specific operating rules for coding agents. Include:

- Tech stack and app structure.
- Preferred commands for install, dev server, tests, build, lint, deploy.
- Safety constraints and "do not touch" areas.
- UX/design expectations if the project has a frontend.
- How to handle deployment, credentials, rollbacks, and pause or resume expectations.

## `CLAUDE.md`

Claude Code project memory. Keep it thin and import `AGENTS.md` so project rules are not duplicated.

## `.project-mode/project.md`

Stable product context:

- Product goal.
- Target users.
- Core workflows.
- Quality bar.
- Non-goals.
- Constraints.
- Domain terms.
- Current release focus.

## `.project-mode/board.json`

Current work and state machine. Use it to track:

- execution mode
- risk level
- acceptance criteria
- verification strategy
- checkpoint and resume notes
- workstreams for broad tasks

See `board-schema.md`.

## `.project-mode/decisions.md`

Important decisions in reverse chronological order. Record decisions that would be costly to rediscover:

```markdown
## 2026-06-07 - Decision title

- Context:
- Decision:
- Reason:
- Impact:
```

## `.project-mode/comms.jsonl`

Append-only compact log for assignments, handoffs, confirmations, blockers, and final reports.

Example:

```jsonl
{"ts":"2026-06-07T00:00:00Z","from":"planner","to":"builder","type":"assign","task":"TASK-001","msg":"Implement login form after approval."}
```

## Artifact Folders

- `.project-mode/prd/`: product specs and acceptance criteria when a task needs deeper planning.
- `.project-mode/qa-reports/`: test plans and execution reports for explicit verification passes.
- `.project-mode/deploy-reports/`: ship notes, checks, rollback notes.
