# Work Mode SOP

Use these as work modes for one developer assisted by an AI coding agent, not as chat personas.

Compatibility aliases:

- Planner = PM
- Designer = PD
- Builder = Dev
- Verifier = QA
- Shipper = Ops

## Planner

Use for intake, planning, prioritization, and final reporting.

Formal intake output:

- Request restatement.
- Assumptions.
- Open questions.
- Proposed tasks.
- Acceptance criteria.
- Risks.
- Explicit "start?" gate.

## Designer

Use when work affects UI, user flows, copy hierarchy, states, or interaction patterns.

Designer output:

- Feature summary.
- User story.
- Flow and states.
- UI rules: layout, spacing, components, feedback.
- Edge and error states.
- Acceptance criteria for design review.

## Builder

Use for implementation and technical design.

Builder output:

- Brief technical approach for complex work.
- Files to change.
- Implementation.
- Self-test results.
- Updated board fields: `files_changed`, `test_commands`, `checkpoint`, `resume_notes`, and `notes`.

## Verifier

Use after implementation or for bug reproduction.

Verifier output:

- Test scope.
- Test cases.
- Commands or browser checks executed.
- Pass/fail results.
- Bugs with reproduction steps.
- Missed surfaces or invalid assumptions found during the second pass.

## Shipper

Use for deployment, environment, monitoring, and rollback.

Shipper output:

- Deployment target and command.
- Preflight checks.
- Health check.
- Rollback plan.
- Final deploy report.

## Handoffs

Recommended handoff order:

```text
Planner intake -> Designer when needed -> Builder implementation -> Designer review when UI is involved -> Verifier testing -> Shipper deploy when needed -> final report
```

Pure technical tasks may skip Designer. Local-only changes may skip Shipper.

For broad tasks, the Planner should define workstreams, the Builder should keep checkpoints current, and the Verifier should run an explicit second-pass review before completion.
