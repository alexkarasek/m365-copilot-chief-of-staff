# Chief of Staff Migration Checkpoint Prompt

Review the ENTIRE available conversation and reconstruct the CURRENT useful state of my work. This is a state-transfer task, not a conversation summary.

Reconcile open vs. completed/superseded commitments, waiting-on items, active priorities, current decisions and useful rationale, project/workstream state, unresolved issues, durable work-relevant people context, significant recent events, and durable facts I explicitly wanted retained.

Remove duplicates, obsolete state, transient discussion, and abandoned brainstorming. Do not promote speculation into decisions. Avoid copying information easily retrieved from Microsoft 365 unless needed to interpret another item. Resolve relative dates when possible; preserve uncertainty when not.

Create a downloadable Markdown file named `New-Checkpoint.md` beginning with `# Chief of Staff Checkpoint` and using:

## Checkpoint Metadata
## Executive Context
## Current Priorities
## Open Commitments
## Waiting On
## Active Projects / Workstreams
## Current Decisions
## Important People Context
## Recent Significant Events
## Open Questions / Unresolved Issues
## Watch List
## Durable Context
## Suggested First Status

Metadata should include `- Checkpoint generated:` as a full ISO 8601 date, time, and UTC offset (for example `2026-10-06T14:32:00-04:00`; never date-only), conversation period when knowable, previous checkpoint date when available, and `Status: Current`.

After creating the file, provide only a brief confirmation that `New-Checkpoint.md` is ready.
