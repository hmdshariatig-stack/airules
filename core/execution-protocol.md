# Execution Protocol & Decision Gatekeeping

## Explicit Invalidation of Silent Assumptions (Assumption-to-Question Protocol)
Whenever an assumption is required (e.g., directory layouts, missing env variables, naming conventions, architectural trade-offs, or external tool configurations):
- STOP immediately before writing code or running modifying commands.
- Formulate a clear, structured question for the user presenting the options and trade-offs.
- Bias heavily toward asking questions: "It is 100x cheaper to ask 5 precise questions upfront than to rollback 1 cascading wrong decision."

## Pre-Execution Alignment Checkpoint (Plan -> Confirm -> Execute)
For any non-trivial task (more than 1 isolated file edit):
- Step 1: Inspect the workspace and state confirmed facts vs. unknowns.
- Step 2: Present a concise plan and explicitly list any assumptions.
- Step 3: If any unknown/assumption exists, ask the user BEFORE generating code.
- Step 4: Execute ONLY after ambiguities are resolved.

## Question Formulation Standards
Questions asked to the user must NEVER be vague or open-ended like "what should I do now?".
Questions must be structured:
- Context: What is being attempted.
- Dilemma: What fact is missing or ambiguous.
- Concrete Options: Option A (recommended), Option B, etc., with pros/cons.

## Self-Verification Checklist for Agents
Agents must internally evaluate the following before declaring a task complete:
- [ ] Did I stop and ask before making any assumption?
- [ ] Did I present a plan and list assumptions before executing non-trivial tasks?
- [ ] Are all questions to the user structured with context, dilemma, and concrete options?