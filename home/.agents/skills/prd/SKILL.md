---
name: prd
description: "Create or review a Problem Requirements Document (PRD) that establishes affected users, evidence, scope, requirements, and success criteria before solution design. Use for ambiguous project ideas, problem discovery, requirements definition, or revising a PRD. Leave architecture and implementation planning to an RFC; do not require a PRD for routine work."
---

# PRD

Define the problem worth solving and the outcomes a solution must deliver. Keep
the user's actual ambition intact while making the boundary of the project clear.
The result should let an implementer assess a proposed solution against the user's
needs without reconstructing the conversation.

## Understand the problem

Read the user's brief, project instructions, and existing PRD or RFC first. Reuse
the established document rather than creating a competing specification. Inspect
an existing product only as needed to understand its current behavior and limits.

Reflect who encounters the problem, what they are trying to do, where the current
experience breaks down, and why it matters. Distinguish observed facts, explicit
user requirements, inferences, assumptions, and unanswered questions. A requested
feature can suggest a need, but is not evidence that every user has that need.
Preserve user-mandated solution choices as constraints with their source; do not
pretend the choice emerged from research or discard it to enforce neutrality.

Ask one to three focused questions at a time only when answers change the problem,
scope, requirements, or success criteria. Do not make the user fill in a blank
template, repeat prior answers, or choose a stack to explain their needs. Draft
known material while questions remain. If asked to proceed without questions,
label assumptions and show how they could affect the outcome.

## Establish evidence

For material gaps, outline a bounded research plan: the question, available
sources, method, and what finding would settle it. Use relevant supplied evidence
and authorized read-only research. Interviews, experiments, or inaccessible data
remain proposed work until they can actually be performed within authorization.
Do not contact people or access unrelated private material just to fill a section.

Give evidence stable IDs such as `E-1`, with a source, date or context, and its
limitations. Include contradictory findings. Never fabricate interviews, personas,
market demand, usage counts, or measurements. For a personal project, the user's
own described experience is valid input, labeled as such. An unsupported claim
stays an assumption; polished prose must not make it appear verified.

## Write the PRD

Read [assets/prd-template.md](assets/prd-template.md) when drafting. Replace its
authoring prompts with project-specific content and remove empty optional sections.
Use the repository's document convention, otherwise
`docs/prds/<project-slug>.md` in the intended project repository. If the current
workspace is unrelated, provide Markdown in the conversation until a destination
is known. Do not create a project repository merely to store the draft.

The document should define:

- **Problems:** Stable `P-1` IDs connecting affected users, their circumstances,
  and consequences to evidence. Describe the current experience before a future
  one. Include why existing workarounds do not meet the need.
- **Requirements:** Stable `R-1` IDs specifying necessary outcomes or behavior,
  linked to problem IDs. Record source and agreement status. Keep implementation
  choices open except for explicit constraints.
- **Scope:** The first useful release, non-goals, and deferred ideas. Preserve all
  explicitly requested requirements unless the user changes them. Distinguish
  committed later phases from optional ideas; neither is current release work.
- **Success:** Stable `SC-1` IDs linking requirements to observable results and
  measurement methods. Record known baselines and proposed targets separately;
  qualitative demonstration is appropriate when analytics would be artificial.
- **Uncertainty:** Open decisions, their consequences, and which requirements or
  phases depend on them. Identify what can proceed despite each unknown.

Use phases only when they clarify delivery boundaries. Each should have a useful
result for its users and explicit completion criteria. Do not create development
tasks, architecture diagrams, API specifications, or a feature backlog to make a
PRD appear more complete. Record candidate approaches as optional inputs to later
design, not as adopted solutions. Leave room to explore options before an RFC.

## Writing and feedback

Keep summaries useful to readers who stop before detail. Share an early draft
once the problem is understandable; polish iteratively. Write for absent and
future collaborators, credit contributions, and preserve decisions from
discussions. Acknowledge each comment with its resolution or reason for declining
it. Ask constructive questions, note strengths, and clarify confusing feedback.
Suggest a direct conversation when written discussion stalls, then record the
outcome. Identify relevant reviewers; contact them only when authorized.

## Review and hand off

Review the actual draft for unsupported claims, requirements without a problem,
missing success coverage, disguised implementation choices, and scope conflicts.
Correct known errors and label unresolved matters without withholding an early
draft until all research is complete. Write or revise the opening summary after
the body so it reflects what the evidence and requirements actually say.

Use `WIP` for unsettled content, `In-Review` for a reviewable proposal, and
`Approved` only when the user's agreement supports it. Record the decision and
date; never infer approval from silence or a completed template. Do not impose a
new approval gate on work already authorized or require a ritual approval phrase.

Return a link to the document with the core problem, release boundary, and
consequential open questions. A PRD request is complete with the requested
document; do not automatically create an RFC or start building. When solution
design is requested, hand off the PRD path and revision, requirement and success
IDs, constraints, non-goals, and remaining unknowns. An RFC may reference these
definitions and add technical acceptance checks; it must not silently redefine
the problem or requirements. Neither document requires the other to exist.

In an intended project repository, add a short project-scoped pointer in its
instructions if necessary for future sessions to find the PRD. Preserve existing
instructions and global configuration. Later task descriptions should reference
the document and relevant IDs rather than copy the specification.

## Maintain the boundary

Respect new explicit user direction. Record accepted changes, their reason, and
affected problem, requirement, success, and phase IDs. Preserve IDs across
revisions and never reuse retired IDs. Update dependent RFC references or tasks
within the authorized scope, or flag what remains unsynchronized.

Treat agent-suggested expansion as a proposal until authorized. Ask only about
unresolved consequential choices and continue unaffected work. Deferred ideas do
not become commitments through repetition. Revisit settled decisions when new
evidence or user direction warrants it, preserving the earlier rationale.
