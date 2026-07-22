# Meeting Prep Tracker

_Tracks the last thing this job actually prepped, per day, so the 15-minute launchd interval
doesn't redo (or re-append) full prep work when nothing about today's calendar has changed since
the last run. See prompts/meeting_prep.txt.tmpl PHASE 0 for how this is read/written._

---

| Date | Meetings fingerprint | Last full prep at | Notes |
|---|---|---|---|
| 2026-07-22 | Ashby / Brandon @ 15:30 (3) \| Brandon pick up day @ 16:15 (2) | 2026-07-22 14:16:48 PDT | Fingerprint dropped "Lolo<>Chris<>Brandon: Get Coffee @ 14:00 (3)" since it started before this gate check (14:16 PM) and rolled off the not-yet-started "remaining" window — same mechanic as the 1:27 PM pass's GEP AMA drop. Checked Granola for new activity since 1:27 PM pass — nothing new. Bookkeeping only; Ashby 1:1 / pickup day sections carried forward unchanged, Lolo coffee content preserved in the note's "in progress" section. |

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
