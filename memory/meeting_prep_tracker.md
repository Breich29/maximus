# Meeting Prep Tracker

_Tracks the last thing this job actually prepped, per day, so the 15-minute launchd interval
doesn't redo (or re-append) full prep work when nothing about today's calendar has changed since
the last run. See prompts/meeting_prep.txt.tmpl PHASE 0 for how this is read/written._

---

| Date | Meetings fingerprint | Last full prep at | Notes |
|---|---|---|---|
| 2026-07-24 | Brandon / Joseph x1x1 @ 11:00 (2) \| 🎪 Embedded R&D Show & Tell @ 11:00 (31) \| REMINDER - Add Update to Corp/Partner Dev Weeklies @ 12:00 (8) \| Send Weekly Partner Stats to team @ 15:30 (0) | 2026-07-24 09:35:26 PDT | First full pass of the day (no prior row existed). Dropped from remaining window as already-started/all-day: "Neeti x Brandon @ 09:30" (in progress at gate-check time, personal contact) and "Aloha Fridays" (all-day culture event, not a real meeting per established convention). Flagged a genuine double-booking at 11:00 AM (Joseph 1x1 vs. Embedded R&D Show & Tell — the latter suppressed per hard "Gusto Embedded" preference, content not detailed). Surfaced today as the Mid-desk 90-day renewal notice window open date (DEC-007) with COM-020 POV still undrafted — top-priority item independent of any single meeting. Granola checked for Joseph Sarni (only the Jul 2 AI Jam on file) and Corp/Partner Dev weekly (next occurrence confirmed Jul 28, today's 12:00 PM block is just Ashby's prep reminder, not the meeting itself).
| 2026-07-22 | NO_MEETINGS | 2026-07-22 19:37:23 PDT | Fingerprint dropped "Brandon pick up day @ 16:15 (2)" since it concluded before this gate check (19:37 PM) and rolled off the not-yet-started "remaining" window — last item on today's calendar, so fingerprint is now NO_MEETINGS. Checked Granola for new activity since the 15:37 pass — nothing new (still only this morning's Diomedes Valuation transcript; no transcript for the Ashby 1:1 or Lolo/Chris coffee). Bookkeeping only; all open commitments and the full-day recap carried forward unchanged. |
| 2026-07-23 | NO_MEETINGS | 2026-07-23 14:58:43 PDT | 03:31 full pass gave real prep to AI Market Mapping Working Sesh (ties to DEC-014 owed market-map deliverable; Joseph Sarni hasn't accepted) and flagged-but-unenriched for Penny's Place (no context anywhere); Ryan Drop Off and Block are personal/self-held, fingerprint-only. 09:17 check: fingerprint dropped "Ryan Drop Off @ 08:15 (1)" and "AI Market Mapping Working Sesh @ 09:00 (4)" — both started/concluded before this gate check and rolled off the not-yet-started "remaining" window; checked Granola since 03:31 — nothing new yet. 14:10 check: fingerprint dropped "Penny's Place \| The Champions Room @ 12:30 (1)" — concluded before this gate check and rolled off. Checked Granola for new activity since 09:17 — still nothing synced for AI Market Mapping or Penny's Place. 14:58 check: fingerprint dropped "Block @ 14:45 (1)" — it started (14:45) before this gate check (14:58) and rolled off the not-yet-started "remaining" window, leaving NO_MEETINGS. Checked Granola for new activity since 14:10 — still nothing synced for AI Market Mapping or Penny's Place. Bookkeeping only; nothing remains on today's calendar needing prep — Obsidian note rewritten to reflect Block as in-progress rather than upcoming. All-day company events ("Anchor Week", Gustoversary) excluded from fingerprint — not real meetings. |

---

## How this is used

- **Fingerprint** = a short representation of today's remaining (not-yet-started) meetings: for
  each, `title @ start_time (attendee_count)`, joined together. Two runs with an identical
  fingerprint for today mean nothing about the calendar has changed since the last full pass.
- **No meetings today** is its own fingerprint value: `NO_MEETINGS`.
- Each date should have at most one row — a new full prep pass updates the existing row for
  today in place (fingerprint + timestamp), it does not append a new row per run.
- Rows older than today are historical record; do not delete them, but they are never read by
  the gate (only today's row matters for the skip decision).
