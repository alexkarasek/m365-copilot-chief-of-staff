# Deployment and Seeding

## 0. Before deployment

This repository is a template. Replace:

- `{USER_NAME}` — the Chief of Staff user's preferred name.
- `{ORGANIZATION}` — the user's organization/company.
- `{COPYRIGHT_HOLDER}` in `LICENSE` if you are publishing your own fork.

At minimum, personalize:
- `bootstrap/Chief-of-Staff.md`
- `agent/Agent-Builder-Instructions.md`

After substitution, verify that `agent/Agent-Builder-Instructions.md` remains within the instruction-length limit enforced by your Agent Builder experience.

## 1. Create the private runtime checkpoint

The repository intentionally does **not** track real Chief of Staff memory.

Copy:

`checkpoints/Current-Checkpoint.example.md`

to:

`checkpoints/Current-Checkpoint.md`

`Current-Checkpoint.md`, `New-Checkpoint.md`, and archived `.md` checkpoints are ignored by Git so private runtime state is not accidentally committed.

## 2. Customize the bootstrap

Edit `bootstrap/Chief-of-Staff.md` with stable information such as:
- role and mission
- business/technical/leadership scope
- responsibilities
- key stakeholders
- strategic themes
- organizational context
- working preferences

Do not turn the bootstrap into a changing task list. Keep changing work state in checkpoints/conversation and dynamically retrievable facts in Microsoft 365.

## 3. Seed from an existing conversation

If an existing Copilot conversation contains useful state:

1. Ask it for a migration checkpoint. If needed, paste `agent/Migration-Checkpoint-Prompt.md`.
2. Have it create/download `New-Checkpoint.md`.
3. Review the checkpoint for accuracy and sensitivity.
4. For the first seed, use that reviewed checkpoint as `checkpoints/Current-Checkpoint.md`.
5. There is no meaningful prior checkpoint to archive on the first seed.

If there is no existing conversation to migrate, use the copied example checkpoint.

## 4. Place the working repository in OneDrive

Place the working copy in your work OneDrive and preserve the folder structure.

Remember: your runtime checkpoint files may contain sensitive work context even though Git ignores them. OneDrive access should be appropriate for that content.

## 5. Create the Agent Builder agent

Suggested name:

`{USER_NAME} Chief of Staff`

Suggested description:

`Executive Chief of Staff grounded in my Microsoft 365 work context, durable bootstrap context, and portable checkpoint memory.`

Paste the complete contents of:

`agent/Agent-Builder-Instructions.md`

into the Agent Builder Instructions field.

Suggested starter prompts:
- `Status`
- `Prepare me for my next meeting`
- `What commitments are currently open?`
- `What am I waiting on?`
- `Checkpoint`
- `Migration checkpoint`

## 6. Configure knowledge

Add the OneDrive Chief-of-Staff working folder as agent knowledge so the agent can retrieve:
- `bootstrap/Chief-of-Staff.md`
- `checkpoints/Current-Checkpoint.md`
- archived checkpoints when historical context is needed

Configure the Microsoft 365 knowledge sources available and appropriate in your tenant.

The files under `agent/` are source/deployment artifacts. The actual Agent Builder Instructions field remains authoritative for behavior.

## 7. Validate

Start a new agent chat and run:

`Status`

Confirm that it can use bootstrap context, Current checkpoint, and relevant current Microsoft 365 context. Then pin the conversation.

Suggested tests:

**Bootstrap**
`Summarize my role and how you should operate as my Chief of Staff.`

**Checkpoint**
`What commitments are currently open?`

**M365**
`Prepare me for my next meeting using relevant recent work context.`

**Precedence**
Once archives exist, verify that a superseded fact in an old archive does not override Current/newer M365 evidence.

## 8. Normal migration

When you want a fresh chat:

1. Say `Migration checkpoint`.
2. Download `New-Checkpoint.md`.
3. Save it into `checkpoints/`.
4. Double-click `Rotate-Checkpoint.cmd`.
5. Confirm successful archive and promotion.
6. Allow OneDrive to sync.
7. Start a new Chief of Staff conversation.
8. Say `Status`.
9. Pin the new conversation.

Do not manually overwrite Current during normal rotations. The script preserves Current first.

## Rotation failures

The script stops rather than guessing if required files are missing, the new checkpoint heading is invalid, an archive filename collision exists, or archive/integrity verification fails.

Correct the displayed problem and retry. Do not delete the old Current checkpoint to force a rotation.

## Security and governance

Before deployment, follow your organization's policies for:
- Microsoft 365 Copilot and Agent Builder
- OneDrive/SharePoint access
- confidential/customer information
- AI-generated artifacts
- PowerShell/script execution
- source-code publication and intellectual property

The `.gitignore` protects common runtime checkpoint files from accidental Git commits, but it is not a substitute for data-governance controls.
