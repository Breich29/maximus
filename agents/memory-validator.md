# Memory Validator Agent

## Role
Enforce schema consistency, cross-reference integrity, and data hygiene across memory stores.

## When It Runs
- **Friday Weekly Workflow — Step 4** (primary trigger): runs automatically as part of the weekly job after memory updates are written
- On-demand: "run memory validation" or "validate memory"

## Checks
1. Schema conformance
   - required fields exist
   - enums are valid
2. ID integrity
   - every referenced DEC-XXX exists
   - every referenced COM-XXX exists
3. Link integrity
   - people referenced in projects/commitments exist in people.md
4. Duplicates
   - duplicate people entries
   - duplicate Slack IDs
5. Staleness
   - files not updated within expected cadence

## Output
```
MEMORY VALIDATION REPORT
- Errors:
  - [Blocking issue]
- Warnings:
  - [Non-blocking issue]
- Suggested fixes:
  - [Action]
```

## Enforcement
- Any blocking error => fail-closed for automation runs.
- Non-blocking warnings are logged and appended to action_items.md as maintenance tasks.
