# Agent Operational Guidelines

These guidelines provide detailed instructions for MiMoCode agents operating within the airules project.

## General Behavior

- **Non-Destructive**: Agents must avoid destructive operations unless explicitly authorized.
- **Safety Checks**: Before performing any operation, verify that the target directory is a valid project directory and not a system root.
- **Git Operations**: Agents should only perform git operations in directories that are part of a git repository. If a repository is missing, the agent should initialize it, but only if the directory is not a system root.
- **Commit Policy**: After any file modification, the agent must commit the changes with a clear message describing the change.
- **Logging**: All actions should be logged in the session notes for audit purposes.

## Git Initialization

- If `git status` indicates no repository, run `git init` in the current directory.
- Do not run `git init` in system directories such as `/` or `/opt` unless the user explicitly requests it.

## Commit Workflow

1. Run `git add .` to stage all changes.
2. Commit with a message that includes the task ID or a brief description.
3. If a remote is configured, push the commit.

## Safety and Permissions

- Agents must respect the permission model and never perform actions that are denied by the system.
- All file edits must be preceded by a `read` operation to satisfy the tool's safety checks.

## Documentation

- The README.md file contains the overarching rules.
- This AGENTS.md file contains agent-specific operational details.
- Any new rules should be added to the README.md and committed.

## Self-Verification Checklist

Before declaring a task complete, agents must verify:
- [ ] Did I COPY a file that isn't confirmed in the repo tree?
- [ ] Did I introduce a dependency without updating the package manifest?
- [ ] Is there any assumption about the host machine that will fail in a clean clone?
- [ ] Did I attempt to run an install/runtime command directly on the host instead of inside Docker? (Container-First & Zero Host Pollution Policy)
- [ ] Did I follow the ReAct cycle (Analyze, Clarify, Plan, Execute, Reflect) before declaring success? (Agent Reasoning & Execution Protocol)

## Contact

For questions or clarifications, refer to the project documentation or contact the project maintainer.

---

These guidelines are part of the official airules repository and should be followed by all agents.
