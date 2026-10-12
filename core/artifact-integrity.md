# Zero Phantom Dependencies & Complete Artifact Integrity

## Principle of Explicit Manifestation
Never reference, import, copy, or invoke any asset, variable, function, or file unless it is either verified in the current workspace or explicitly declared/generated within the same proposed changeset.

## Principle of Atomic Completeness
Every introduced change must be self-contained and immediately buildable/executable without relying on implicit user-side manual steps.

## Domain-Specific Enforcements

### Docker / Containerization
- Prohibit `COPY` of optional/metadata files (`.env*`, `README*`, configs) unless verified or safely guarded via regex/wildcard glob patterns (e.g., `COPY .env.exampl[e] ./`).
- Decouple runtime config from build context (prefer `ENV`, entrypoint generation, or compose mounts with `required: false`).

### Code & Packages (Python, Node, Go, Rust, etc.)
- Any introduced `import`/`require` MUST atomically update the manifest (`requirements.txt`, `pyproject.toml`, `package.json`, etc.) in the exact same diff.
- Prohibit stubbing or referencing undefined helpers/types across modules unless defined or imported from a confirmed file.

### Environment & Secrets
- Fallbacks for environment variables must always exist in code (sensible defaults), or configuration files must be auto-seeded via setup scripts/commands.

## Self-Verification Checklist for Agents
Agents must internally evaluate the following before declaring a task complete:
- [ ] Did I COPY a file that isn't confirmed in the repo tree?
- [ ] Did I introduce a dependency without updating the package manifest?
- [ ] Is there any assumption about the host machine that will fail in a clean clone?