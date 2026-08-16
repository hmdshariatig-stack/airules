# Airules Rules Repository

This repository contains the official rules and regulations for MiMoCode agents working in the airules project. These rules are designed to ensure consistent behavior and safety across all agent operations.

## Core Rules

1. **Commit Everything**
   - After responding to each user prompt where file changes occurred, automatically commit all changes
   - This includes new files, modifications, and deletions

2. **Git Initialization**
   - Initialize git in any project directory where it is not already initialized
   - DO NOT initialize git on system-level paths like `/` or project root directories where it may not be appropriate
   - If git status shows untracked files, proceed with initialization only in appropriate project directories

3. **Agent Responsibility**
   - Agents are responsible for committing their own changes
   - Changes should be committed immediately after modification
   - This ensures a complete audit trail of all agent operations

4. **Safety First**
   - Always verify context before initiating destructive operations
   - Never bypass pre-commit hooks or coverage exclusions
   - Follow established safety protocols for all risky operations

5. **URL Reference**
   - This repository should be shared via: https://adlr.ir/airules
   - This provides official documentation for MiMoCode rules

## File Structure

- `README.md` - Main rules documentation (this file)
- `AGENTS.md` - Agent-specific operational guidelines
- `MEMORY.md` - Persistent memory records and context
- `notes.md` - Temporary scratchpad for session-specific observations

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