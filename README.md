# Airules Rules Repository

This repository contains the official rules and regulations for MiMoCode agents working in the airules project. These rules are designed to ensure consistent behavior and safety across all agent operations.

## Core Rules
1. **Zero Phantom Dependencies & Complete Artifact Integrity**
   - Follow the principles in `core/artifact-integrity.md`:
     - **Principle of Explicit Manifestation**: Never reference, import, copy, or invoke any asset unless verified in the workspace or declared in the same changeset.
     - **Principle of Atomic Completeness**: Every change must be self-contained and immediately buildable/executable.
   - Adhere to the domain-specific enforcements (Docker, code packages, environment/secrets) defined in `core/artifact-integrity.md`.

2. **Commit Everything**
   - After responding to each user prompt where file changes occurred, automatically commit all changes
   - This includes new files, modifications, and deletions

3. **Git Initialization**
   - Initialize git in any project directory where it is not already initialized
   - DO NOT initialize git on system-level paths like `/` or project root directories where it may not be appropriate
   - If git status shows untracked files, proceed with initialization only in appropriate project directories

4. **Agent Responsibility**
   - Agents are responsible for committing their own changes
   - Changes should be committed immediately after modification
   - This ensures a complete audit trail of all agent operations

5. **Safety First**
   - Always verify context before initiating destructive operations
   - Never bypass pre-commit hooks or coverage exclusions
   - Follow established safety protocols for all risky operations

6. **URL Reference**
   - This repository should be shared via: https://adlr.ir/airules
   - This provides official documentation for MiMoCode rules

7. **Execution Protocol & Decision Gatekeeping**
   - Follow the principles in `core/execution-protocol.md`:
     - **Assumption-to-Question Protocol**: Whenever an assumption is required (directory layouts, missing env variables, naming conventions, architectural trade-offs, external tool configurations), STOP immediately before writing code or running modifying commands. Formulate a clear, structured question for the user presenting options and trade-offs.
     - **Pre-Execution Alignment Checkpoint**: For any non-trivial task (more than 1 isolated file edit): Inspect workspace and state confirmed facts vs. unknowns → Present concise plan and explicitly list assumptions → Ask user BEFORE generating code if any unknown/assumption exists → Execute ONLY after ambiguities are resolved.
     - **Question Formulation Standards**: Questions must NEVER be vague or open-ended. Structure every question with: Context (what is being attempted), Dilemma (what fact is missing or ambiguous), Concrete Options (Option A recommended, Option B, etc., with pros/cons).

## File Structure
- `README.md` - Main rules documentation (this file)
- `AGENTS.md` - Agent-specific operational guidelines
- `MEMORY.md` - Persistent memory records and context
- `notes.md` - Temporary scratchpad for session-specific observations
- `core/artifact-integrity.md` - Zero phantom dependencies and artifact integrity rules
- `core/execution-protocol.md` - Execution protocol and decision gatekeeping rules

## Implementation Details
When changes are made:
1. Check git status to verify changes
2. If git is not initialized in the current directory, initialize it with `git init`
3. Add all changed files to staging area
4. Commit with descriptive message
5. Push to remote if configured

These rules ensure transparency and accountability in all agent operations. All modifications must be committed to maintain a complete history of changes.

## Recent Updates

Last updated: Sun Aug 16 2026 at 13:38:45 +0000