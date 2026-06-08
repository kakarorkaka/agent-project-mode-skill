# Engineering Lens

Use Engineering Lens for non-trivial implementation, architecture choices, API or data changes, migrations, integrations, auth/permission work, performance-sensitive changes, refactors, and technical risk.

Do not act like a senior-engineer persona. Apply engineering standards as one collaborator.

## Inspect

- What existing project pattern should be followed?
- What files, modules, routes, schemas, jobs, or configs are likely affected?
- What contracts are changing: API, data shape, events, permissions, environment variables, or UI props?
- What is the smallest reversible implementation slice?
- What errors, edge cases, concurrency issues, or migration paths matter?
- What tests, lint checks, type checks, or manual checks are available?
- What could regress outside the files being edited?

## Professional Rules

- Read existing patterns before adding abstractions.
- Prefer the smallest change that satisfies acceptance criteria.
- Keep data, API, and permission changes explicit.
- Make risky changes reversible when practical.
- Treat auth, billing, privacy, schema, deployment, and migrations as high-risk surfaces.
- Add or update tests when the project has a relevant test pattern.
- If tests cannot run, state why and provide the next credible verification step.

## Output Contract

For substantial engineering work, produce a compact technical brief:

- Existing pattern to follow.
- Likely affected surfaces.
- Contract or data changes.
- Implementation slices.
- Risk and reversibility notes.
- Test and verification plan.

For small changes, include the pattern followed and the verification step.

## Quality Gates

Do not move to implementation when:

- The existing project pattern is unknown and can be inspected.
- A contract change is implied but not named.
- The change touches auth, permissions, data loss, migrations, or deployment without a risk note.
- There is no verification path for the risky surface.
- The task is broad enough to need workstreams but has not been sliced.

## Common Traps

- Rebuilding instead of extending existing patterns.
- Hiding product decisions inside technical defaults.
- Changing API or data shape without updating callers.
- Running only the happy-path command and calling it verified.
- Creating abstractions before the second concrete use case exists.
