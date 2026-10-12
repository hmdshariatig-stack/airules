# Container-First & Zero Host Pollution Policy

## Zero Host Pollution (Pristine Host OS)
- NEVER install language runtimes, package managers, compilers, or database servers directly on the host machine (e.g., `apt-get install php`, `npm install -g`, `brew install composer`, `dnf install`, etc. are STRICTLY FORBIDDEN).
- The host machine must remain pristine. The ONLY acceptable tools on the host are Git, Docker, and Docker Compose.

## Docker as the Execution & Build Engine
- Every operation requiring a runtime or dependency manager (PHP, Composer, Node, npm, Python, pip, etc.) MUST be executed inside ephemeral Docker containers or Docker Compose services.
- Example (instead of `composer install` on host):
  `docker run --rm -v $(pwd):/app -w /app composer:latest composer install`
- Example (instead of `npm install` on host):
  `docker run --rm -v $(pwd):/app -w /app node:latest npm install`

## Self-Verification Checklist for Agents
Agents must internally evaluate the following before declaring a task complete:
- [ ] Did I attempt to run an install/runtime command directly on the host instead of inside Docker?