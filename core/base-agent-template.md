# Base Agent Template

## Purpose

This template defines the foundational structure for all agents operating within the airules repository. It implements the **Execution Protocol & Decision Gatekeeping**, **Container-First & Zero Host Pollution**, and **Agent Reasoning & Execution Protocol (ReAct Cycle)** policies.

## Architecture Overview

```
┌─────────────────────────────────────────────────────┐
│                 AIRULES AGENT FRAMEWORK             │
├─────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────┐ │
│  │ Execution    │  │ Container    │  │ Reasoning│ │
│  │ Protocol     │→ │ First Policy │→ │ Cycle    │ │
│  │ (Decision    │  │ (Zero Host   │  │ (ReAct)  │ │
│  │  Gatekeeping)│  │  Pollution)  │  │          │ │
│  └──────────────┘  └──────────────┘  └──────────┘ │
│         ↓                ↓                  ↓      │
│   Plan → Clarify → Analyze → Execute → Reflect │
└─────────────────────────────────────────────────────┘
```

## Core Components

### 1. Execution Protocol & Decision Gatekeeping

Every non-trivial task must follow this strict cycle:

1. **ANALYZE & VERIFY** – Inspect the workspace. Identify confirmed facts vs. unknowns. Never assume missing files or environment configs exist.
2. **CLARIFY BEFORE DRIFT** – If critical parameters are ambiguous, STOP and ask the user structured options. Do not make cascading assumptions.
3. **PLAN** – Deconstruct the task into minimal, testable, atomic steps.
4. **EXECUTE** – Apply changes using native platform tools. Ensure every code diff is atomically complete (code + manifests + configs).
5. **REFLECT & VERIFY** – Evaluate tool feedback. Check against the Self-Verification Checklist before declaring success.

### 2. Container-First & Zero Host Pollution

- **Zero Host Pollution** – The host OS must remain pristine. The ONLY acceptable tools on the host are Git, Docker, and Docker Compose.
- **Docker as the Execution & Build Engine** – Every operation requiring a runtime or dependency manager (PHP, Composer, Node, npm, Python, pip, etc.) MUST be executed inside ephemeral Docker containers or Docker Compose services.
- **Example**:
  ```bash
  # ❌ FORBIDDEN – Direct host installation
  apt-get install php
  
  # ✅ ALLOWED – Inside Docker
  docker run --rm -v $(pwd):/app -w /app composer:latest composer install
  ```

### 3. Agent Reasoning & Execution Protocol (ReAct Cycle)

Each agent must follow this cognitive lifecycle for every task:

- **ANALYZE & VERIFY** – Inspect workspace, identify confirmed facts vs. unknowns.
- **CLARIFY BEFORE DRIFT** – Stop immediately if parameters are ambiguous; ask structured options.
- **PLAN** – Break down into atomic steps.
- **EXECUTE** – Apply changes using native tools; ensure atomic completeness.
- **REFLECT & VERIFY** – Check against the Self-Verification Checklist.

## Self-Verification Checklist

Before declaring a task complete, agents must verify:
- [ ] Did I COPY a file that isn't confirmed in the repo tree?
- [ ] Did I introduce a dependency without updating the package manifest?
- [ ] Is there any assumption about the host machine that will fail in a clean clone?
- [ ] Did I attempt to run an install/runtime command directly on the host instead of inside Docker? (Container-First & Zero Host Pollution Policy)
- [ ] Did I follow the ReAct cycle (Analyze, Clarify, Plan, Execute, Reflect) before declaring success? (Agent Reasoning & Execution Protocol)

## Template Structure

All generated agents should include:

1. **Header** – Agent identity, version, and task ID
2. **Context** – Summary of the task and constraints
3. **Analysis** – Verified facts and identified gaps
4. **Clarification Request** – If any ambiguity exists, pose structured options
5. **Plan** – Atomic steps with dependencies
6. **Execution** – Code changes with Docker isolation
7. **Reflection** – Verification against the checklist

## Example Task Flow

```
Task: "Build a PHP application with Composer"

1. ANALYZE & VERIFY
   - Confirmed: airules repo exists, Docker is installed
   - Unknown: Specific PHP version, project structure

2. CLARIFY BEFORE DRIFT
   - Need to know PHP version requirement
   - Need to know project structure (composer.json, src/, etc.)

3. PLAN
   - Step 1: Check existing project structure
   - Step 2: Create Docker-compose.yml for PHP app
   - Step 3: Install dependencies via docker run

4. EXECUTE
   - Generate Dockerfile and docker-compose.yml
   - Run `docker run --rm -v $(pwd):/app -w /app composer:latest composer install`

5. REFLECT & VERIFY
   - Checklist: All items satisfied? ✓
```

## Implementation Guidelines

- **Never** run `apt-get`, `pip install`, `npm install` directly on the host.
- **Always** use `docker run --rm` for ephemeral environments.
- **Always** commit changes with descriptive messages.
- **Always** verify against the Self-Verification Checklist before marking complete.

## Files in This Repository

- `core/execution-protocol.md` – Decision gatekeeping rules
- `core/container-first.md` – Zero host pollution policy
- `core/reasoning-protocol.md` – ReAct cycle protocol
- `README.md` – Public-facing rules documentation
- `AGENTS.md` – Agent operational guidelines
- `MEMORY.md` – Persistent memory records
- `notes.md` – Session-specific observations

---

**Note:** This template is intentionally minimal. Each agent should expand upon it based on the specific task requirements while adhering to the core policies.
