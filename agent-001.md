# Agent-001: Simple PHP Application Builder

## Task
Build a simple PHP application with Composer using the base agent template.

## Base Template Applied

All tasks must follow the **Execution Protocol & Decision Gatekeeping**, **Container-First & Zero Host Pollution**, and **Agent Reasoning & Execution Protocol (ReAct Cycle)** policies.

## Core Components

### 1. Execution Protocol & Decision Gatekeeping
- **ANALYZE & VERIFY** – Confirmed: airules repo exists, Docker is available
- **CLARIFY BEFORE DRIFT** – No ambiguity detected
- **PLAN** – Create Docker environment, install dependencies via Docker
- **EXECUTE** – Generate Dockerfile and docker-compose.yml, run `docker run --rm -v $(pwd):/app -w /app composer:latest composer install`
- **REFLECT & VERIFY** – Check Self-Verification Checklist

### 2. Container-First & Zero Host Pollution
- All operations must run inside Docker containers
- NO direct host installations (apt-get, pip, npm, etc.)
- Example: `docker run --rm -v $(pwd):/app -w /app composer:latest composer install`

### 3. Agent Reasoning & Execution Protocol (ReAct Cycle)
- **ANALYZE & VERIFY** – Repo structure confirmed, Docker available
- **CLARIFY BEFORE DRIFT** – None needed
- **PLAN** – Step-by-step atomic decomposition
- **EXECUTE** – Generate infrastructure files
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
- ✅ All core rule files are present and properly formatted
- ✅ Base agent template is available at `core/base-agent-template.md`

### Step 2: Clarify (None Needed)
No ambiguities detected. The task is straightforward: build a PHP application with Composer.

### Step 3: Plan
1. Create `Dockerfile` with PHP runtime
2. Create `docker-compose.yml` for easy orchestration
3. Generate `composer.json` with basic PHP dependencies
4. Run `docker run --rm -v $(pwd):/app -w /app composer:latest composer install`

### Step 4: Execute
Generate the required Docker files.

### Step 5: Reflect & Verify
Check all policies are satisfied before declaring success.

## Files to Create

- `Dockerfile` – Multi-stage build for PHP application
- `docker-compose.yml` – Orchestrated service definition
- `composer.json` – PHP dependency management
- `php-app/` – Sample PHP application structure (if needed)

## Expected Outcome

A working PHP application built entirely within Docker containers, demonstrating the ReAct cycle and all core policies.
