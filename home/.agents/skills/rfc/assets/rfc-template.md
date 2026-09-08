## RFC: [Project title]

| Field | Value |
| --- | --- |
| Summary | [One sentence describing the proposed outcome] |
| Created | [Date] |
| Status | WIP |
| RFC revision | 0.1 |
| Owner | [User or designated owner] |
| Target release | [Release boundary, not an invented deadline] |
| Related context | [Relevant brief, discussion, design, or existing RFC links] |
| PRD | [Path and revision if one exists; omit otherwise] |

[Add contributors, reviewers, current product version, and target product version
only when relevant and known. RFC revision and product version are distinct.]

[Briefly describe what this project will enable and for whom.]

## Background

[Explain the current experience, its problem, and why the project matters.
Include enough context for an implementer joining without the original chat.
Link supporting material and distinguish evidence from assumptions.]

## Proposal

[Describe the chosen product and approach. Show the intended first-release
journey from the user's initial action to a useful result.]

### Scope and non-goals

| ID | Included requirement | Connection to the desired outcome |
| --- | --- | --- |
| R-1 | [Specific behavior] | [Why the user needs it] |

[If a PRD owns the requirements, use qualified links to its IDs in this table
and describe the design's coverage. Do not create competing requirement text.]

**Non-goals:** [Explicit exclusions and boundaries.]

**Deferred ideas:** [Optional later possibilities, not promised work.]

### Constraints

[Known requirements for platform, data, integrations, compatibility, visual
design, operation, or other relevant qualities. Label proposed choices.]

## User experience

[Describe screens, commands, or API interactions as appropriate. Cover the
critical path and relevant empty, loading, error, and recovery states. Include
concrete input/output examples or visual references when they clarify intent.
For an existing product, address compatibility and consistency.]

## Implementation

[Outline component responsibilities, data flow, interfaces, storage, and
integration boundaries only as needed. Explain consequential choices and their
tradeoffs. Clearly identify what remains an implementation choice.]

### Alternatives and abandoned ideas

[Optional: Record meaningful alternatives actually considered, their drawbacks,
and why they were rejected or abandoned. Do not manufacture a comparison.]

## Acceptance criteria

| ID | Requirement | Observable pass condition | Verification |
| --- | --- | --- | --- |
| AC-1 | R-1 | [Concrete scenario and expected result] | [How to demonstrate it] |

**Release completion:** [Which criteria and relevant quality checks must pass,
plus any explicit user review requirement. Do not invent an approval gate.]

## Delivery plan

| Task | Deliverable and boundary | Requirement / acceptance | Dependencies | Verification and stopping condition |
| --- | --- | --- | --- | --- |
| T-1 | [Bounded result] | R-1 / AC-1 | [None or task IDs] | [Evidence that completes this task] |

[Add rollout, migration, or rollback details only when the project needs them.]

## Assumptions and open questions

| Item | Assumption or unresolved decision | Impact / blocked tasks | Resolution |
| --- | --- | --- | --- |
| Q-1 | [Unconfirmed choice] | [Specific effect] | [Open, or actual user decision] |

## Decision and scope history

| Date / revision | Decision and reason | Affected IDs | Agreement |
| --- | --- | --- | --- |
| [Date / 0.1] | Initial proposal | [IDs] | Draft, not yet agreed |

## Review

[Record the feedback sought and relevant reviewers if known. As comments arrive,
track each concern, its disposition and reason, and unresolved disagreement.
Preserve contributor credit and decisions reached outside the document. Remove
this authoring note; do not invent feedback or agreement.]

## Implementation handoff

[Reference this RFC's actual path and revision. State the release boundary, next
task and acceptance IDs, and any blockers. Instruct the implementer to follow
the latest user decisions, record accepted scope changes here, and stop when
the agreed criteria pass. Link verification evidence as work is completed.]
