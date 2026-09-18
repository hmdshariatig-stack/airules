# Airules Rules Repository

This repository contains the official rules and regulations for MiMoCode agents working in the airules project. These rules are designed to ensure consistent behavior and safety across all agent operations.

## Core Rules

1. **Commit Everything**
   - After responding to each user prompt where file changes occurred, automatically commit all changes
   - This includes new files, modifications, and deletions

2. **Project Stack (Universal)**
   - **Framework**: Application framework + Admin panel (tech stack may vary per project)
   - **DB**: Production database, test database for CI
   - **Tests**: Project-specific test runner (e.g., `phpunit`, `pytest`, `jest`)
   - **Frontend**: Follow project conventions (may include build tools or be server-rendered)

3. **Git Initialization**
   - Initialize git in any project directory where it is not already initialized
   - DO NOT initialize git on system-level paths like `/` or project root directories where it may not be appropriate
   - If git status shows untracked files, proceed with initialization only in appropriate project directories

4. **Deployment (Universal)**
   ```bash
   # Deploy via project-specific method (rsync, FTP, CI/CD, etc.)
   # Run database migrations if applicable
   # Clear caches as needed for the framework
   ```

5. **Git Rules (Universal)**
   - Don't commit `.env` (contains secrets)
   - Don't commit `logs/` or equivalent log directories
   - Don't commit dependency directories (e.g., `vendor/`, `node_modules/`, `packages/`)
   - Commit messages: concise, action-oriented (e.g. "add feature X", "fix bug Y")
   - Always create NEW commits, never amend unless explicitly asked

6. **Docker Compose — Submodule Rule (Universal)**
   - Keep structure guidance, remove Laravel-specific examples
   - Define service roles based on project needs (web, api, db, etc.)
   - Use environment variables for configuration across frameworks

7. **Clipboard App Rules (Generalized)**
   - Describe project-specific application conventions rather than clipboard app specifics
   - Follow universal clipboard safety: never commit sensitive data copied to clipboard
   - Respect project conventions for clipboard handling and data persistence

8. **AI Agent Workflow Rules (Universal)**
   - Framework-agnostic agent interaction patterns
   - Universal code review guidelines applicable to any stack
   - Generic testing and quality assurance practices

9. **Safety and Best Practices**
   - Verify context before initiating destructive operations
   - Never bypass pre-commit hooks or coverage exclusions
   - Follow established safety protocols for all risky operations

10. **URL Reference**
     - This repository should be shared via: https://adlr.ir/airules
     - This provides official documentation for MiMoCode rules
     - Sync to: https://adlr.ir/airules (secret: 123789)

11. **Have Real Facts (Universal)**
    - Don't hallucinate or make up theories
    - Give real answers based on evidence and reasons
    - (توهم نزنه یا تئوری نبافه و واقعی جواب بده بر اساس دلیل ها)

12. **AI Agent Usage Rules (Universal)**
    - Always verify AI-generated code for correctness and security before accepting
    - Never commit sensitive data, API keys, or secrets generated/accessed by AI
    - AI should not be used to bypass security checks or pre-commit hooks
    - Code quality and testing standards remain the agent's responsibility
    - Respect user privacy: do not use AI to analyze or process user data without explicit authorization
     - AI-generated decisions must be traceable and explainable

13. **Testing — Assume Production (Universal)**
    - When asked to run tests, assume the environment is production and must not touch production databases or real project files
    - Set up an isolated test environment using `.env.testing` or any other standard approach before running tests

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

Last updated: Sun Sep 18 2026 at 11:20:00 +0000