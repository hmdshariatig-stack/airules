# Agent Operational Guidelines

These guidelines provide detailed instructions for MiMoCode agents operating within the airules project.

## General Behavior

- **Non-Destructive**: Agents must avoid destructive operations unless explicitly authorized.
- **Safety Checks**: Before performing any operation, verify that the target directory is a valid project directory and not a system root.
- **Git Operations**: Agents should only perform git operations in directories that are part of a git repository. If a repository is missing, the agent should initialize it, but only if the directory is not a system root.
- **Commit Policy**: After any file modification, the agent must commit the changes with a clear message describing the change.
- **Logging**: All actions should be logged in the session notes for audit purposes.
- **AI Usage**: AI-generated code must be verified for security and correctness before committing; never commit secrets or user data produced by AI.

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

## Domain Lookup Rule (Mandatory)

**Trigger**: Whenever the user mentions a domain name (with or without a `sub.` prefix) in this `nginx-certbot` repo, the agent MUST immediately respond with a structured summary of that domain. Do not ask follow-up questions — produce the summary from the filesystem in one reply.

For the mentioned domain `<domain>`, report:

1. **Nginx config**: `data/nginx/sub.<domain>.conf` — exists? show path, summarize what it serves (static, proxy, PHP/FastCGI, redirect, etc.) and the upstream/backend.
2. **Website files**: `websites/<domain>/` — exists? list the top-level contents so the user sees the project type.
3. **Archived files** (if any): `archive/<domain>/`.
4. **SSL certificate**: `data/certbot/conf/live/<domain>/` — exists? note it.
5. **Docker / service stack**: any `ymls/<domain>.yml` or `ymls/*<domain>*.yml` — show service name, image/build, ports, and `make up-<svc>` target.
6. **Status commands** (always include these so the user can act on the report):
   - `make monitor-domain DOMAIN=<domain>`
   - `make test-domain DOMAIN=<domain>`
   - `make up-<service>` / `make down-<service>` / `make logs-<service>`
   - `make archive domain=<domain>` / `make restore domain=<domain>`
   - `make deploy DOMAIN=<domain>`
7. **Logs location**: `/var/log/nginx/<domain>.log` (access) and `/var/log/nginx/<domain>.error.log`.

Keep the response in Persian (Farsi) if the user wrote in Persian, otherwise English. Be terse — bullet points, no preamble. If a file/path does not exist, say so explicitly instead of guessing.

## Documentation

- The README.md file contains the overarching rules.
- This AGENTS.md file contains agent-specific operational details.
- Any new rules should be added to the README.md and committed.

## Contact

For questions or clarifications, refer to the project documentation or contact the project maintainer.

---

These guidelines are part of the official airules repository and should be followed by all agents.
