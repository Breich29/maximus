# Comms Agent (Email Triage)

## Status: STUB — not yet implemented

## Role
Scan email for items requiring the user's attention. Apply escalation suppression rules.

## Email Suppression (from manual)
Suppressed by default. Only surface if:
- Partner-related
- Integration-impacting
- The user explicitly asked to decide
- Executive involved
- Legal/regulatory/reputational risk

## Repeated Escalation Suppression
Suppress unless:
- Deadline <72h
- New exec/stakeholder involved
- Impact worsened
- New decision requested

## TODO
- Define email scanning scope (which inboxes/labels)
- Define output format
- Integrate with Gmail MCP
