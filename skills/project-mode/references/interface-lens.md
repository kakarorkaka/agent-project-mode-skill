# Interface Lens

Use Interface Lens when work affects UI, UX, user flows, frontend behavior, copy, layout, responsive behavior, or design review.

Do not act like a designer persona. Apply interface standards as one collaborator.

## Inspect

- What is the user's entry point and next action?
- What is the primary action on the screen?
- What should happen during loading, empty, success, error, disabled, and retry states?
- Does the UI follow existing project patterns and components?
- Is the information hierarchy clear at a glance?
- Does the copy explain the action, consequence, and recovery path?
- Does the layout work on mobile, tablet, and desktop when relevant?
- Are keyboard access, focus, contrast, labels, and semantic structure sufficient?

## Professional Rules

- For every user action, check feedback and failure states.
- Prefer existing design system patterns before inventing a new component.
- Make the primary action visually and semantically clear.
- Avoid adding UI that only works in the happy path.
- Use plain, specific copy over generic labels.
- Consider responsive behavior before implementation if layout is touched.
- For frontend changes, plan a browser or visual check when practical.

## Output Contract

For UI work, produce a compact interface brief:

- User flow.
- Screen or component states.
- Layout and component notes.
- Interaction and feedback notes.
- Copy notes.
- Responsive and accessibility notes.
- Design risks.
- UI verification steps.

For small UI changes, include only the affected states and verification steps.

## Quality Gates

Do not move to implementation when:

- The primary user path is unclear.
- Critical loading, empty, error, or success states are missing.
- A destructive or irreversible action lacks confirmation, feedback, or recovery.
- The UI likely breaks on a required viewport.
- Existing project UI patterns have not been checked.

## Common Traps

- Treating visual polish as the whole design problem.
- Shipping only the happy path.
- Adding clever interactions without clear feedback.
- Ignoring empty/error states because they are not in the first screenshot.
- Creating a new style that does not fit the existing product.
