# Extraction Tracker

_Tracks last scan timestamps per source to avoid re-processing and enable incremental updates._

---

| Source | Last Scanned | Window Covered | Records Processed | Notes |
|---|---|---|---|---|
| Slack DMs (from:me) | 2026-05-21 | Apr 21 – May 21 (30 days) | ~40 messages across 7 people | Core pass complete |
| Slack DMs (to:me) | 2026-05-21 | Apr 21 – May 21 (30 days) | ~40 messages across 7 people | Core pass complete |
| Slack user search | 2026-05-21 | n/a | ~25 people looked up | All Tier 1 + Tier 2 resolved |
| Granola meetings | 2026-05-21 | Apr 21 – May 21 (30 days) | 14 meetings listed, 3 transcripts read | Transcripts: Chris<>Jessica<>Brandon, Alex/Brandon, Farron/Brandon |
| Google Calendar | 2026-05-21 | n/a (API returning historical data) | Used for cadence inference | Calendar API returned 2018 data; used Granola as primary calendar signal |
| Glean org chart | 2026-05-21 | Current state | Brandon's full profile + manager chain | Title shows "Corporate Development" (updated from old role) |
| Glean user activity | 2026-05-21 | PARTIAL | File 379K tokens — unreadable | Known blind spot; compensated with Granola + Slack |
| Slack #maximus-updates channel (channel-sync) | not yet run — pending first sync | n/a | 0 | Cursor for bin/run_channel_sync.sh (see prompts/channel_sync.txt.tmpl). `last_ts: 0` — on first real run, the job seeds this to the channel's current latest message and starts capturing forward from that point; it does NOT walk the full channel history back to 2026-05-21. See memory-sync design note below re: separate one-time historical backfill. |

---

## Next Scheduled Scans

- **Daily brief:** Morning + night-before (per preferences.md)
- **Weekly memory sweep:** Friday 2:00 PM PT (includes a Phase 2B channel-sync catch-up if the daily job's cursor is >36h stale)
- **Channel sync (memory + Obsidian):** Daily Mon-Fri ~10:00 PM PT (bin/run_channel_sync.sh) — reads #maximus-updates since `last_ts` above and files decisions/commitments/partner+project status/people facts into memory/*.md + Obsidian. Never touches action_items.md.
- **Next DM sweep due:** 2026-05-22 (daily)
- **Next Granola sweep due:** 2026-05-22 (daily)

### Note: pre-2026-07-14 backfill gap
memory/decisions.md, commitments.md, partners.md, projects.md, people.md, and priorities.md
have drifted since 2026-05-21 (~7 weeks) while the cloud brief/review routines kept posting
current knowledge to #maximus-updates without any local write-back mechanism. Channel Sync's
cursor above intentionally starts from "now," not from 2026-05-21 — reprocessing 7 weeks of
channel history in one automated run risks bulk-misclassifying old, possibly-superseded
information into the canonical stores unsupervised. Reconciling that historical gap is a
candidate for a separate, explicitly-triggered one-time backfill pass (same extraction logic,
wider window, human-in-the-loop review before writing) — not something this incremental job
should attempt silently. Flagged for Brandon's decision; not run as part of this change.
