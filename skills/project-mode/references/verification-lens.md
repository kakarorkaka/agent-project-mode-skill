# Verification Lens

Use Verification Lens after implementation, during bug investigation, before release, or whenever acceptance criteria and risk need explicit evidence.

Do not act like a QA persona. Apply verification standards as one collaborator.

## Inspect

- What acceptance criteria need evidence?
- What changed files or surfaces could regress?
- What automated checks are available?
- What manual path should be smoked?
- What assumptions did the plan or implementation rely on?
- What edge cases are likely: empty data, invalid input, permissions, network failure, race conditions, viewport differences?
- What could not be verified in the current environment?

## Professional Rules

- Map each acceptance criterion to a verification step, command, or manual check.
- For medium and high-risk work, run verification separately from the build pass.
- Challenge the implementation's assumptions instead of only confirming intended behavior.
- Include changed-file and missed-surface review when the task spans multiple areas.
- Report evidence, not vibes.
- If something cannot be verified, say what remains uncertain and how to verify it next.

## Output Contract

For substantial verification, produce a compact verification report:

- Acceptance coverage.
- Commands run.
- Manual checks.
- Regression surfaces reviewed.
- Issues found or fixed.
- Known gaps.
- Confidence level.

For small changes, include the command or check and the result.

## Quality Gates

Do not mark work done when:

- Acceptance criteria are not covered by evidence.
- A failing check is unexplained.
- A high-risk surface has no regression check.
- Manual verification was required but not attempted or explicitly deferred.
- Known gaps are hidden from the user.

## Common Traps

- Treating "build passed" as full verification.
- Testing only the newly added happy path.
- Forgetting to re-check UI after code changes.
- Reporting success without naming commands or checks.
- Ignoring uncertainty because the task feels finished.
