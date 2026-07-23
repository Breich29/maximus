# Meeting Prep Tracker

_Tracks the last thing this job actually prepped, per day, so the 15-minute launchd interval
doesn't redo (or re-append) full prep work when nothing about today's calendar has changed since
the last run. See prompts/meeting_prep.txt.tmpl PHASE 0 for how this is read/written._

---

| Date | Meetings fingerprint | Last full prep at | Notes |
|---|---|---|---|
| 2026-07-22 | NO_MEETINGS | 2026-07-22 19:37:23 PDT | Fingerprint dropped "Brandon pick up day @ 16:15 (2)" since it concluded before this gate check (19:37 PM) and rolled off the not-yet-started "remaining" window — last item on today's calendar, so fingerprint is now NO_MEETINGS. Checked Granola for new activity since the 15:37 pass — nothing new (still only this morning's Diomedes Valuation transcript; no transcript for the Ashby 1:1 or Lolo/Chris coffee). Bookkeeping only; all open commitments and the full-day recap carried forward unchanged. |
| 2026-07-23 | Ryan Drop Off @ 08:15 (1) \| AI Market Mapping Working Sesh @ 09:00 (4) \| Penny's Place \| The Champions Room @ 12:30 (1) \| Block @ 14:45 (1) | 2026-07-23 03:31:25 PDT | First check of the day (no prior row) — full pass. Real prep given to AI Market Mapping Working Sesh (ties to DEC-014 owed market-map deliverable; Joseph Sarni hasn't accepted) and flagged-but-unenriched for Penny's Place (no context anywhere). Ryan Drop Off and Block are personal/self-held, included in fingerprint only, not given prep cards. All-day company events ("Anchor Week", Gustoversary) excluded from fingerprint — not real meetings. |

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
