# Agent: code-reviewer

## Task
Create a code review agent that analyzes code changes and provides structured feedback using the base agent template.

## Base Template Applied

All tasks must follow the **Execution Protocol & Decision Gatekeeping**, **Container-First & Zero Host Pollution**, and **Agent Reasoning & Execution Protocol (ReAct Cycle)** policies.

## Core Components

### 1. Execution Protocol & Decision Gatekeeping
- **ANALYZE & VERIFY** – Confirmed: airules repo exists, Docker available, base template at `core/base-agent-template.md`
- **CLARIFY BEFORE DRIFT** – Need to clarify: code review scope (syntax, architecture, security, performance), output format (JSON, markdown, inline), integration points (GitHub PRs, GitLab MRs, local)
- **PLAN** – Create Docker environment for code analysis tools, implement review logic, define output format
- **EXECUTE** – Generate Dockerfile, docker-compose.yml, review scripts, configuration
- **REFLECT & VERIFY** – Check Self-Verification Checklist

### 2. Container-First & Zero Host Pollution
- All operations must run inside Docker containers
- NO direct host installations (apt-get, pip, npm, etc.)
- Example: `docker run --rm -v $(pwd):/app -w /app phpstan/phpstan analyse /app/src`

### 3. Agent Reasoning & Execution Protocol (ReAct Cycle)
- **ANALYZE & VERIFY** – Repo structure confirmed, Docker available
- **CLARIFY BEFORE DRIFT** – Pose structured options for review scope, output format, integration
- **PLAN** – Step-by-step atomic decomposition
- **EXECUTE** – Generate infrastructure and review logic files
- **REFLECT & VERIFY** – Validate against checklist

## Self-Verification Checklist

- [ ] Did I COPY a file that isn't confirmed in the repo tree?
- [ ] Did I introduce a dependency without updating the package manifest?
- [ ] Is there any assumption about the host machine that will fail in a clean clone?
- [ ] Did I attempt to run an install/runtime command directly on the host instead of inside Docker? (Container-First & Zero Host Pollution Policy)
- [ ] Did I follow the ReAct cycle (Analyze, Clarify, Plan, Execute, Reflect) before declaring success? (Agent Reasoning & Execution Protocol)

## Implementation

### Step 1: Analyze & Verify
- ✅ airules repo exists at `/home/hamid/airules/`
- ✅ Docker is available and functional
- ✅ Base agent template exists at `core/base-agent-template.md`
- ✅ All core rule files are present
- ❓ Unknown: Specific code review requirements (scope, tools, output format, integration)

### Step 2: Clarify Before Drift
**Context:** Building a code review agent for analyzing code changes
**Dilemma:** Need to define the review scope, output format, and integration method
**Options:**
- **Option A (Recommended):** Focus on static analysis (PHPStan, Psalm, ESLint, Pylint) + security scanning (Bandit, Semgrep) with markdown output for local use
- **Option B:** Full GitHub/GitLab PR integration with inline comments via API
- **Option C:** Custom rule engine for airules-specific patterns with JSON output for CI/CD

### Step 3: Plan
1. Define agent configuration schema (YAML/JSON)
2. Create `Dockerfile` with multi-stage build for analysis tools
3. Create `docker-compose.yml` for orchestration
4. Implement `review.sh` wrapper script for common operations
5. Create `rules/` directory for airules-specific review rules
6. Create `config/` directory for tool configurations
7. Implement core review logic in language-agnostic manner

### Step 4: Execute
Generate the required Docker files, configuration, and review logic.

### Step 5: Reflect & Verify
Check all policies are satisfied before declaring success.

## Files to Create

- `Dockerfile` – Multi-stage build with static analysis tools
- `docker-compose.yml` – Orchestrated service definition
- `review.sh` – Entry point wrapper script
- `config/` – Tool configurations (phpstan.neon, eslint.config.js, pylintrc, etc.)
- `rules/` – Airules-specific review patterns
- `agent-code-reviewer.md` – This agent definition file

## Expected Outcome

A functional code review agent that:
- Runs entirely in Docker containers
- Supports multiple languages via configurable tools
- Produces structured markdown/JSON output
- Integrates with CI/CD pipelines
- Follows airules policies (ReAct cycle, Container-First, Decision Gatekeeping)