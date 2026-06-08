# Expert Lens Routing

Use expert lenses as professional judgment frames, not personas.

Work modes answer "what phase is the work in?" Expert lenses answer "what professional standards should be applied?"

Load only the lenses that matter for the current task. Do not turn every request into a full review.

## Lens Map

- **Product Lens**: requirements, scope, prioritization, acceptance criteria, product risk, user value.
- **Interface Lens**: user flow, UI states, interaction, copy, responsive behavior, accessibility, design review.
- **Engineering Lens**: implementation strategy, project patterns, contracts, data/API boundaries, reversibility, tests.
- **Verification Lens**: acceptance coverage, regression surfaces, commands/manual checks, final confidence.

## Routing By Flow

Fast Track:

- Do not load a lens unless the task clearly touches that specialty.
- Use a compact self-check and report what changed.
- Escalate if the task touches new routes, schemas, API contracts, auth, deployment, or broad refactors.

Guided Flow:

- Load Product Lens for new features, ambiguous requirements, prioritization, or acceptance criteria.
- Load Interface Lens when UI, UX, copy, user states, or frontend flows are involved.
- Load Engineering Lens before non-trivial implementation.
- Load Verification Lens after implementation, or before editing when verification strategy is unclear.

Deep Flow:

- Read this routing file first.
- Load every relevant lens before editing.
- Define workstreams, dependencies, acceptance criteria, and verification strategy.
- Run a second verification pass after implementation.

## Mode And Lens Composition

- Planner + Product Lens: turn an idea into a scoped, prioritized, testable task.
- Designer + Interface Lens: turn behavior into clear user flow, states, copy, and interaction rules.
- Builder + Engineering Lens: turn the task into safe implementation slices.
- Verifier + Verification Lens: challenge assumptions and confirm completion with evidence.
- Shipper + Verification Lens: confirm release readiness, health checks, and rollback notes.

## Output Rules

- Keep lens output concise and actionable.
- If a lens finds no meaningful issue, record a one-line pass.
- If a lens finds a blocker, stop and explain the smallest decision needed.
- Ask the user only when ambiguity changes product behavior, risk, cost, or implementation direction.
- Do not ask every checklist question. Apply the checklist as professional judgment.

## Stop Conditions

- Product: user, problem, scope, or acceptance cannot be inferred safely.
- Interface: a critical user path lacks required states or feedback.
- Engineering: the implementation path cannot be made safe, reversible, or aligned with existing patterns.
- Verification: there is no credible way to verify the acceptance criteria.
