# Meeting Prep Tracker

_Tracks the last thing this job actually prepped, per day, so the 15-minute launchd interval
doesn't redo (or re-append) full prep work when nothing about today's calendar has changed since
the last run. See prompts/meeting_prep.txt.tmpl PHASE 0 for how this is read/written._

---

| Date | Meetings fingerprint | Last full prep at | Notes |
|---|---|---|---|

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
