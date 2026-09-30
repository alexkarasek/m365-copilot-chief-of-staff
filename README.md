# Microsoft 365 Copilot Chief of Staff

A reusable reference architecture for a personal Microsoft 365 Copilot Chief of Staff with portable checkpoint memory.

> This is a community/reference implementation, not an official Microsoft product or Microsoft-supported architecture.

## What it does

This pattern combines a persistent/pinned Copilot conversation with a small OneDrive knowledge repository so a Chief of Staff agent can retain useful continuity without depending indefinitely on one chat thread.

The architecture separates:

- **Agent Builder instructions** — behavior and orchestration.
- **Microsoft 365** — current enterprise context.
- **Bootstrap** — durable role and operating context.
- **Current checkpoint** — canonical portable state between chats.
- **Checkpoint archive** — historical/episodic snapshots.
- **Pinned conversation** — working/intermediate memory.
- **Local scripts** — deterministic checkpoint rotation.

## Quick start

1. Clone or download this repository.
2. Read [`DEPLOYMENT-AND-SEEDING.md`](DEPLOYMENT-AND-SEEDING.md).
3. Replace `{USER_NAME}` and `{ORGANIZATION}` in the template files.
4. Customize `bootstrap/Chief-of-Staff.md`.
5. Copy `checkpoints/Current-Checkpoint.example.md` to `checkpoints/Current-Checkpoint.md`.
6. Configure the M365 Copilot agent using `agent/Agent-Builder-Instructions.md`.
7. Put the working repository in OneDrive and configure it as agent knowledge as described in the deployment guide.

## Repository

```text
M365-Copilot-Chief-of-Staff/
├── README.md
├── DEPLOYMENT-AND-SEEDING.md
├── LICENSE
├── .gitignore
├── Rotate-Checkpoint.cmd
├── bootstrap/
│   └── Chief-of-Staff.md
├── checkpoints/
│   ├── Current-Checkpoint.example.md
│   └── archive/
├── agent/
│   ├── Agent-Builder-Instructions.md
│   └── Migration-Checkpoint-Prompt.md
└── scripts/
    └── Rotate-Checkpoint.ps1
```

## Memory model

| Layer | Purpose |
|---|---|
| Current conversation | Working/intermediate memory |
| `Current-Checkpoint.md` | Canonical portable state |
| `checkpoints/archive/` | Historical/episodic snapshots |
| `bootstrap/Chief-of-Staff.md` | Durable role/context |
| Microsoft 365 | Current enterprise context |

The objective is not perfect recall. It is to preserve enough high-value state that a fresh conversation can continue with useful continuity.

## Normal use

Use the pinned Chief of Staff conversation naturally.

- **`Status`** reconstructs what matters now.
- **`Checkpoint`** reconstructs/compacts useful current state.
- **`Migration checkpoint`** creates a downloadable `New-Checkpoint.md` when moving to a fresh chat.

## Migration workflow

1. Say **`Migration checkpoint`** in the active Chief of Staff chat.
2. Download `New-Checkpoint.md`.
3. Save it into the local OneDrive-synced `checkpoints/` folder.
4. Double-click `Rotate-Checkpoint.cmd`.
5. The script validates the new checkpoint, archives and verifies the old Current checkpoint, then promotes New to Current.
6. Allow OneDrive to sync.
7. Start a fresh Chief of Staff agent conversation.
8. Say **`Status`** and pin the new conversation.

## Privacy by default

Runtime memory is intentionally excluded from Git:

```text
checkpoints/Current-Checkpoint.md
checkpoints/New-Checkpoint.md
checkpoints/archive/*.md
```

The repository contains only `Current-Checkpoint.example.md`. This reduces the chance that real commitments, people context, customer information, or other work state will accidentally be committed to a repository.

Do not remove these exclusions unless you understand the privacy implications.

## Why the CMD wrapper?

Corporate Windows environments commonly restrict direct `.ps1` execution. `Rotate-Checkpoint.cmd` launches the included PowerShell script with a process-scoped execution-policy bypass. It does not permanently change the machine's execution policy.

Organizations may enforce policies that prevent even a process-scoped bypass. Follow your organization's approved script-execution process where applicable.

## Source precedence

The supplied agent instructions generally prefer:

1. current authoritative Microsoft 365 evidence;
2. explicit newer information in the active conversation;
3. `Current-Checkpoint.md`;
4. bootstrap context;
5. archived checkpoints.

Archived checkpoints are history, not current truth.

## Important notes

Microsoft 365 Copilot and Agent Builder capabilities can vary by tenant, licensing, rollout state, and administrator configuration. Validate knowledge-source behavior and downloadable artifact generation in your environment.

Before using this pattern with company data, follow your organization's policies for Microsoft 365, OneDrive, AI tools, data handling, source-code publication, and information classification.

## License

MIT. Before publishing a fork, replace `{COPYRIGHT_HOLDER}` in `LICENSE` with the appropriate individual or organization after confirming who owns the work.
