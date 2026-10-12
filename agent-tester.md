# Agent: tester

## Task
Create a test execution and validation agent that runs unit, integration, and e2e tests using Docker containers, following the base agent template.

## Base Template Applied

All tasks must follow the **Execution Protocol & Decision Gatekeeping**, **Container-First & Zero Host Pollution**, and **Agent Reasoning & Execution Protocol (ReAct Cycle)** policies.

## Core Components

### 1. Execution Protocol & Decision Gatekeeping
- **ANALYZE & VERIFY** – Confirmed: airules repo exists, Docker available, base template at `core/base-agent-template.md`. Unknowns: test framework (PHPUnit, Jest, PyTest), test types (unit/integration/e2e), test runner configuration, CI/CD integration.
- **CLARIFY BEFORE DRIFT** – Need to clarify: which test frameworks to support, test execution scope, output format, Docker image base, reporting requirements.
- **PLAN** – Create Docker environment for test execution, implement test runner scripts, define configuration, integrate with reporting.
- **EXECUTE** – Generate Dockerfile, docker-compose.yml, test scripts, configuration files.
- **REFLECT & VERIFY** – Check Self-Verification Checklist.

### 2. Container-First & Zero Host Pollution
- All operations must run inside Docker containers
- NO direct host installations (apt-get, pip, npm, etc.)
- Example: `docker run --rm -v $(pwd):/app -w /app php:8.2 php vendor/bin/phpunit`

### 3. Agent Reasoning & Execution Protocol (ReAct Cycle)
- **ANALYZE & VERIFY** – Repo structure confirmed, Docker available
- **CLARIFY BEFORE DRIFT** – Pose structured options for test frameworks, scope, integration
- **PLAN** – Step-by-step atomic decomposition
- **EXECUTE** – Generate infrastructure and test execution logic files
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
- ❓ Unknown: Specific test framework requirements (PHPUnit, Jest, PyTest, etc.), test types, CI/CD integration

### Step 2: Clarify Before Drift
**Context:** Building a test execution agent for running and validating code tests
**Dilemma:** Need to define the test framework, test types, and integration method
**Options:**
- **Option A (Recommended):** Multi-language support with Docker images for PHPUnit (PHP), Jest (Node.js), PyTest (Python) + JUnit/HTML reporting with CI/CD integration
- **Option B:** Single-language focus (e.g., PHPUnit only) with custom Docker image
- **Option C:** Framework-agnostic approach with configurable test commands and output parsing

### Step 3: Plan
1. Define agent configuration schema for test frameworks and environments
2. Create `Dockerfile` with multi-stage build supporting multiple test runners
3. Create `docker-compose.yml` for orchestrating test execution across services
4. Implement `run-tests.sh` wrapper script for common test operations
5. Create `test-config/` directory for framework-specific configurations
6. Implement `reports/` directory for test output collection and reporting
7. Implement core test execution logic in language-agnostic manner

### Step 4: Execute
Generate the required Docker files, configuration, and test execution logic.

### Step 5: Reflect & Verify
Check all policies are satisfied before declaring success.

## Files to Create

- `Dockerfile` – Multi-stage build with multiple test runner support
- `docker-compose.yml` – Orchestrated service definition for test environments
- `run-tests.sh` – Entry point wrapper script for test execution
- `test-config/` – Tool configurations (phpunit.xml, jest.config.js, pytest.ini, etc.)
- `reports/` – Test output collection and reporting
- `agent-tester.md` – This agent definition file

## Expected Outcome

A functional test execution agent that:
- Runs entirely in Docker containers
- Supports multiple test frameworks and languages
- Produces structured JUnit/HTML/JSON reporting
- Integrates with CI/CD pipelines
- Follows airules policies (ReAct cycle, Container-First, Decision Gatekeeping)