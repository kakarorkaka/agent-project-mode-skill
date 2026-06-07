# Board Schema

Use `.project-mode/board.json` as the durable task board. Keep it compact, resumable, and valid JSON.

## Status Values

- `intake`: request captured, not yet clarified.
- `planned`: scope and acceptance criteria drafted.
- `designing`: designer work is active.
- `ready_to_build`: design or requirements are sufficient for implementation.
- `building`: implementation is active.
- `review`: implementation needs review or design review.
- `verifying`: verification is active.
- `ready_to_ship`: verification passed, waiting for final user approval or release.
- `shipping`: release or deployment work is active.
- `paused`: work should resume later from a known checkpoint.
- `done`: complete and reported.
- `blocked`: cannot proceed without input or an external state change.

## Execution Modes

- `fast_track`: low-risk direct execution.
- `guided_flow`: the default mode for scoped product work.
- `deep_flow`: larger, cross-cutting, or high-risk work that needs decomposition, checkpoints, or stronger verification.

## Work Mode Owners

- `planner`
- `designer`
- `builder`
- `verifier`
- `shipper`

## Recommended Shape

```json
{
  "project": "Project name",
  "version": 2,
  "updated_at": "2026-06-07T00:00:00Z",
  "current_focus": "Finish onboarding improvements",
  "default_execution_mode": "guided_flow",
  "tasks": [
    {
      "id": "TASK-001",
      "type": "feature",
      "title": "Short task title",
      "status": "planned",
      "phase": "planning",
      "owner": "planner",
      "priority": "medium",
      "risk_level": "medium",
      "execution_mode": "guided_flow",
      "parallelizable": false,
      "workstreams": [],
      "verification_strategy": [
        "self_check"
      ],
      "depends_on": [],
      "created_at": "2026-06-07T00:00:00Z",
      "updated_at": "2026-06-07T00:00:00Z",
      "description": "One paragraph",
      "acceptance_criteria": [
        "Observable condition"
      ],
      "files_changed": [],
      "test_commands": [],
      "checkpoint": "",
      "resume_notes": "",
      "blockers": [],
      "notes": []
    }
  ]
}
```

## Task Types

- `feature`: new behavior or user-facing improvement.
- `bugfix`: defect investigation and repair.
- `fast_track`: small direct task.
- `maintenance`: project upkeep, dependency update, cleanup, monitoring.
- `research`: investigation, evaluation, or technical discovery.
- `migration`: broad or cross-cutting change.

## Verification Strategies

- `self_check`: quick builder verification.
- `test_suite`: automated tests or linters.
- `ui_review`: browser or UI verification.
- `regression_sweep`: focused search for missed surfaces.
- `adversarial_review`: explicit challenge of assumptions or edge cases.
- `manual_smoke`: compact user-path smoke test.

## Workstreams

Use `workstreams` only when a task is broad enough to benefit from decomposition. A workstream can stay lightweight:

```json
{
  "id": "WS-1",
  "title": "Update API handlers",
  "status": "planned",
  "depends_on": [],
  "notes": []
}
```

`parallelizable` means the work can be split cleanly, not that it must always execute concurrently.

## Board Discipline

- Add a task before starting guided or deep work.
- Keep `files_changed` and `test_commands` current after implementation.
- Keep `checkpoint` and `resume_notes` current for work that spans sessions.
- Use `paused` when context must be preserved for later continuation.
- Use `blocked` only when progress genuinely needs user input or an external change.
- Mark `done` only after verification and user-facing summary are complete.
