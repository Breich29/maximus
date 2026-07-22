# Meeting Prep Tracker

_Tracks the last thing this job actually prepped, per day, so the 15-minute launchd interval
doesn't redo (or re-append) full prep work when nothing about today's calendar has changed since
the last run. See prompts/meeting_prep.txt.tmpl PHASE 0 for how this is read/written._

---

| Date | Meetings fingerprint | Last full prep at | Notes |
|---|---|---|---|
| 2026-07-22 | Gusto & U.S. Bank - Bi-Weekly Partnership Sync @ 11:00 (8) \| Weekly Partner Dev Sync! @ 11:00 (5) \| Notion Training | Gusto Corp Dev Biweekly @ 11:30 (20) \| GEP AMA @ 13:00 (20) \| Lolo<>Chris<>Brandon: Get Coffee @ 14:00 (3) \| Ashby / Brandon @ 15:30 (3) \| Brandon pick up day @ 16:15 (2) | 2026-07-22 09:32:42 PDT | First full pass of the day (no prior row existed despite a 9:21 AM Obsidian note from an earlier run — likely a tracker-write gap in that run; this pass reconciles). FY27 Roadmap × Partner Ecosystem excluded from fingerprint (already in progress at gate time, started 9:30). |

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
