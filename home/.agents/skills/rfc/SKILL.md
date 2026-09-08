---
name: rfc
description: "Develop or review an RFC proposing a solution to a defined problem, with scope, tradeoffs, acceptance criteria, and implementation tasks. Use for solution design, RFC drafting, or realigning work to an existing RFC. Use a PRD for problem discovery; do not impose either document on routine implementation requests."
---

# RFC

Turn an idea into a durable reference for what to build, why it matters, and when
to stop. Preserve the user's desired product and level of ambition. A smaller
scope is a recommendation to discuss, not permission to omit requested behavior.

Structure the RFC with metadata, a short overview, Background, Proposal, and
topic-specific sections. Preserve useful rejected approaches and their rationale.
Use explicit scope, acceptance criteria, and bounded tasks to keep implementation
aligned with the user's intent.

## Establish intent

Read the user's existing brief, relevant project instructions, and any existing
RFC and PRD before asking questions. Inspect only enough of an existing repository to
understand its constraints. Reuse the current RFC rather than creating a rival
source of truth. For a new project, do not invent a repository or stack.

When a PRD exists, reference its path and revision. It owns the problem,
requirements, and outcome measures; the RFC owns the proposed design and delivery
plan. Reuse its requirement IDs and link to their definitions. Without a PRD,
establish sufficient problem context here; a separate PRD is not a prerequisite.
If the user is still exploring the problem, suggest that focus without starting
a second document unless requested. Do not force every project through both.

Reflect the intended user, problem, desired outcome, and known boundaries in a
few sentences. Separate explicit user requirements, observed facts, proposed
decisions, and unconfirmed assumptions. Preserve distinctive requirements in the
user's own terms instead of replacing them with generic product language.

Ask only questions whose answers change the product, scope, acceptance, or a
consequential technical choice. Prefer one to three focused questions at a time,
with concrete options and a recommendation when helpful. Resolve product intent
before architecture. Do not ask the user to fill out a blank template or repeat
information already supplied. If enough context exists, draft immediately.

While waiting for answers, document what is known. Mark unanswered choices as
open, with their impact and the work they block. If the user asks for a draft
without questions, use clearly labeled assumptions. Do not invent confirmation.

## Write the RFC

Read [assets/rfc-template.md](assets/rfc-template.md) when drafting. Adapt its
prompts into project-specific prose; remove empty optional sections and authoring
notes. Match depth to the actual project. Keep the overview understandable without
reading the technical design.

## Writing and feedback

Keep summaries useful to readers who stop before technical detail. Share an early
draft once its central idea is understandable; polish iteratively. Write for
absent and future collaborators, credit contributions, and preserve decisions
from discussions. Acknowledge each comment with its resolution or reason for
declining it. Ask constructive questions, note strengths, and clarify confusing
feedback. Suggest a direct conversation when written discussion stalls, then
record the outcome. Identify relevant reviewers; contact them only when authorized.

## Define the solution

Use the repository's established RFC location. Otherwise prefer
`docs/rfcs/<project-slug>.md` within the intended project repository. If the current
workspace is unrelated to the proposed project, return the Markdown draft in the
conversation until its destination is known. Do not scatter project files there.

The document must make these decisions easy to find:

- **Purpose:** Who benefits, their current problem, and the observable outcome.
- **First release:** The coherent user journey that the user actually wants to
  ship. Do not quietly relabel requested features as future work to simplify it.
- **Scope:** Included behavior, explicit non-goals, and deferred ideas. Deferred
  ideas are not commitments or implementation tasks.
- **Constraints:** User-mandated platforms, integrations, compatibility, and
  relevant quality requirements. Propose measurable targets where needed, but
  label them as proposals until agreed.
- **Acceptance:** Stable IDs such as `AC-1`, each with an observable result and a
  verification method. Include relevant failure and empty states. Replace vague
  claims like "fast" or "intuitive" with concrete checks.
- **Design:** Component responsibilities, boundaries, data flow, and important
  interfaces sufficient to guide implementation. Explain meaningful tradeoffs.
  Prefer quality, simplicity, robustness, scalability, and maintainability over
  ease of development; avoid speculative infrastructure for unrequested features.
- **Uncertainty:** Assumptions, open questions, and alternatives that affect the
  proposal. Retain rejected decisions and reasons when they prevent rediscovery.

Give each requirement defined here a stable ID such as `R-1`, then link acceptance
criteria to those IDs. Qualify imported IDs with their source document to avoid
collisions. Keep IDs stable through revisions; do not recycle retired IDs.
Technical acceptance checks must demonstrate the linked requirements without
silently replacing PRD outcome measures or introducing product requirements.
Establish the product boundary before deriving tasks. If key choices remain
open, label affected tasks provisional rather than presenting a settled plan.

## Derive a bounded implementation plan

Keep the initial plan inside the RFC unless the project already uses a separate
task system. Prefer deliverable slices of user behavior over a long inventory of
files to edit. For each task record:

- Task ID and concrete deliverable.
- Requirement and acceptance IDs it serves, or the specific prerequisite it
  enables for a linked task.
- Relevant components and dependencies, without inventing file paths.
- Verification and an explicit stopping condition.

Every included requirement needs acceptance coverage and every criterion needs
planned verification. Every task needs a scope justification. Necessary enabling
work is allowed; unrelated enhancements belong in deferred ideas. Do not create
remote issues, send the RFC to others, or begin implementation solely because the
RFC contains a plan.

## Establish a usable baseline

Review the draft for contradictions, unsupported assumptions, unrequested
features, missing acceptance coverage, and tasks that exceed the proposal. Correct
known errors and expose unresolved choices in the draft without delaying useful
feedback for a complete task plan. Report the intended outcome, release
boundary, and remaining consequential decisions concisely with a link to the RFC.

Use `WIP` while substantive questions remain, `In-Review` for a reviewable draft,
and `Approved` only when supported by the user's actual agreement. Record what
was agreed and when. Do not require a ritual approval phrase or repeat a request
already answered. If the user has authorized implementation, continue within that
authorization; RFC status is not a new permission gate. A request to draft an RFC
alone ends with the completed draft and any unresolved questions.

Include a short implementation handoff in the RFC: its path and revision, the
release boundary, the next task and its acceptance IDs, and blocking questions.
Future task descriptions must reference this RFC rather than duplicate its scope.
When maintaining an intended project repository, add a concise pointer in its
project instructions if needed to make the RFC discoverable in future sessions.
Scope that pointer to this project, preserve existing instructions, and never
rewrite global agent configuration as part of kickoff.

## Keep later work aligned

When using the skill to resume, replan, or check implementation, read the RFC and
latest user direction first. Identify the active task and its acceptance criteria.
Respect newer explicit user decisions, and update the RFC and affected tasks so
the document follows the agreed project rather than overruling the user.
When an accepted change affects PRD-owned requirements, update that document and
the RFC's references together within the authorized scope. If either document is
unavailable, identify the mismatch rather than claiming they are synchronized.

Exercise engineering judgment within the agreed behavior. For an agent-proposed
change to product behavior, exclusions, consequential constraints, or acceptance,
describe the specific delta and why it is needed before doing dependent work.
Ask only if the decision is not already authorized, and continue unaffected work.
Do not reopen settled decisions without new evidence or user direction.

Record accepted scope changes with their reason and affected requirement,
acceptance, and task IDs. Keep proposals distinguishable from accepted changes.
If another applicable instruction requires incidental quality fixes, track them
separately with their reason; do not silently convert them into product scope.

At task completion, compare delivered behavior and verification evidence against
its acceptance criteria. Report gaps honestly. When the release criteria are met,
stop expanding the feature set. Deferred ideas remain deferred until requested.
