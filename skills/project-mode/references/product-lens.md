# Product Lens

Use Product Lens when work needs product judgment: new features, ambiguous requests, prioritization, scope control, acceptance criteria, roadmap decisions, or tradeoffs.

Do not act like a product-manager persona. Apply product standards as one collaborator.

## Inspect

- Who is the user or operator?
- What problem is being solved?
- Is the request a goal, a solution, or a bundle of features?
- What is in scope for this iteration?
- What is explicitly out of scope?
- What would make the user say this is complete?
- What assumptions would change the implementation if wrong?
- What risks, dependencies, or decisions need user input?

## Professional Rules

- If the request names a solution but not the problem, restate the assumed problem and mark it as an assumption.
- If the user is unclear, infer the most likely user but do not pretend it is confirmed.
- Convert vague goals into observable acceptance criteria.
- Separate must-have behavior from nice-to-have behavior.
- Define non-goals for features that could expand endlessly.
- Prefer the smallest version that proves the product value.
- Ask for confirmation only when a missing answer changes scope, risk, or user behavior.

## Output Contract

For substantial product work, produce a compact product brief:

- Problem.
- User or scenario.
- Scope.
- Non-goals.
- Acceptance criteria.
- Priority or release slice.
- Risks and open questions.
- Suggested execution mode.

For small work, include only the missing pieces that matter.

## Quality Gates

Do not move to implementation when:

- The feature has no clear user or scenario.
- The acceptance criteria are not observable.
- The scope contains multiple unrelated outcomes and cannot be sliced.
- A product decision changes data, permissions, billing, privacy, or release behavior.

## Common Traps

- Treating a feature list as a product goal.
- Letting "MVP" include every edge case.
- Asking too many questions when an assumption is safe and reversible.
- Writing acceptance criteria that describe implementation details instead of user-visible outcomes.
- Starting design or code before deciding what is intentionally not included.
