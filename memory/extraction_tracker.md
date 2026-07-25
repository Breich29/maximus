# Extraction Tracker

_Tracks last scan timestamps per source to avoid re-processing and enable incremental updates._

---

| Source | Last Scanned | Window Covered | Records Processed | Notes |
|---|---|---|---|---|
| Slack DMs (from:me) | 2026-07-17 | 2026-07-10 – 2026-07-17 (7-day pass) | ~20 messages, ~8 people | Weekly-sweep pass used a 7-day window (matching this job's cadence), not a full walk back to 2026-05-21 — the ~2-month DM gap is the same kind of deferred-backfill decision already flagged below for channel-sync, not silently reprocessed. New DM contacts found: Delia He, Phil Tesorero (both added to people.md). |
| Slack DMs (to:me) | 2026-07-17 | 2026-07-10 – 2026-07-17 (7-day pass) | ~20 messages, ~8 people | Same pass as above (from:me / to:me run together). Note: the search tool's inline result timestamps (e.g. "56544982-02-18") are malformed/unusable — cross-validated against `slack_read_channel`, which returns correct real timestamps, so message content and windowing are trustworthy even though the search tool's displayed dates are not. Flagging as a tool-display bug, not a data problem. |
| Slack user search | 2026-07-17 | n/a | 3 people looked up (Devesh Verma, Phil Tesorero, Delia He) | Backfilled Devesh Verma's Slack ID (U0A2XPD2CPL) in people.md |
| Granola meetings | 2026-05-21 | Apr 21 – May 21 (30 days) | 14 meetings listed, 3 transcripts read | Transcripts: Chris<>Jessica<>Brandon, Alex/Brandon, Farron/Brandon. Not re-run this sweep — Slack #maximus-updates + calendar covered the past week's signal; per-run logs show Granola has had intermittent OAuth issues (e.g. "offline" Jul 16 AM brief). Worth a direct Granola health check outside this sweep. |
| Google Calendar | 2026-07-17 | 2026-07-10 – 2026-07-24 (past 7d + next 7d) | 50 + 47 events | API returning correct current-period data now (the 2018-data issue noted 2026-05-21 is resolved). Note: the Jul 10–17 pull hit the 50-event max_results cap before reaching end-of-day Jul 17 — Jul 17's own events weren't in this pull, but were already covered via Slack #maximus-updates content (Mal Arun, Lars Wensel, MidDesk Workflow Review, etc., already in people.md/action_items.md). |
| Glean org chart | 2026-05-21 | Current state | Brandon's full profile + manager chain | Title shows "Corporate Development" (updated from old role) |
| Glean user activity | 2026-05-21 | PARTIAL | File 379K tokens — unreadable | Known blind spot; compensated with Granola + Slack. Not re-attempted this sweep (optional step, skipped given time already spent on Slack channel-sync catch-up + calendar). |
| Slack #maximus-updates channel (channel-sync) | 2026-07-23 22:00 PDT | 2026-07-20 22:01 PDT → 2026-07-23 22:00 PDT | 12 messages (0 threads with replies found — no reply-count indicators on any message in this window) | Cursor for bin/run_channel_sync.sh (see prompts/channel_sync.txt.tmpl). `last_ts: 1784866252.811039` (Night-Before Prep, Thu Jul 23 @ 9:10 PM PDT — now the newest message in the channel). Processed 12 messages spanning Jul 20 11:23 PM PDT (ts 1784615027.964669, exclusive of prior cursor 1784607051.487219) through Jul 23 9:10 PM PDT: Brandon's Jul 20 11:23 PM corrections note + 4 "Action items updated" bot recaps of it (all already reflected in commitments.md/projects.md as of the Jul 22 weekly-sweep pass — zero re-writes, pure dedupe skips), Brandon's ad-hoc "surface all COMs" request + the bot's COM-surface reply (no new facts, a status recap matching current commitments.md), and 5 Daily AM Brief / Night-Before Prep bot posts (Jul 21–23) carrying real signal: (1) MidDesk Jul24-opens/Jul28-closes date language resolved as the same window, not a discrepancy; (2) COM-018 (SYB deck → Izzy) status corrected from "close to done" back to open/no-completion-evidence per 6 consecutive days of bot restatement; (3) COM-022 (Browserbase counter-redlines → Cindy) due-dated to Jul 22 and marked overdue; (4) new Diomedes risk — Ben Stein sent a Crossbeam partnership invite the night of Jul 23. Writes: commitments.md (COM-018, COM-020, COM-022), partners.md (Mid-desk), projects.md (Diomedes). Does not walk history back to 2026-05-21 — see memory-sync design note below re: separate one-time historical backfill. **Weekly-sweep Phase 2B check (2026-07-24 18:00 PDT): cursor was 20h old (<36h) — skipped, daily job current.** |
| Slack DMs (from:me / to:me), weekly sweep | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-24 (7-day pass, 3 pages/~60 results per direction — heavy Jul 24 volume meant paginated coverage reached back to ~Jul 23 11:00 AM in depth; earlier-week days assumed lower-signal based on no new names surfacing in the pages read, consistent with the deferred-backfill posture already established for this job) | ~120 messages scanned, 6 new DM contacts | New DM contacts found and added directly to people.md: Tyrone Guillory Jr. (Procurement), Kinzi Top (Technical Solutions PE), Jeremy Grasso (BD & Alliances — resolves a pending-confirmation flag), Sam Haber (Gusto Embedded Product), Joseph Barrientos (personal/social). Substantive project signal: Browserbase deal green-lit internally (Chris Elkins), awaiting Daniella Seim sign-off + Ironclad approval — written to commitments.md/partners.md/projects.md/people.md. Ambiguous Izzy Rogner-Hall ownership-transfer signal flagged to action_items.md, not resolved into projects.md. |
| Slack mentions (to:<@UCBUECCKF>), weekly sweep | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-24 (2 pages read, dominated by Jul 24 same as DM scan) | ~40 messages scanned | No new people beyond DM scan overlap. Confirmed Diomedes financial-model working session (Delia He/Brandon Swartz/Ashby Taylor group DM) — written to projects.md. |
| Google Calendar, weekly sweep | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-31 (past 7d + next 7d, 100 events across 2 pulls) | 100 events | Resolved "Colleen" (AI Services Marketplace, flagged unresolved since Jul 19) to **Colleen Oates**, Head of Indirect GTM, via FY27 Roadmap × Partner Ecosystem organizer. Surfaced Elena Sharma (elena.sharma@gusto.com) as a 2026-07-28 "Firm Direct API Access" attendee alongside Kinzi Top — flagged needs-confirmation. No other new people crossing the 2+-meeting threshold identified this pass. |
| Glean org-wide scan, weekly sweep | — | — | Skipped | Optional step skipped this pass — Slack DM/mention scan + calendar pull already surfaced high-signal new people and project updates; time budget prioritized writing those up over a supplementary Glean sweep. |

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
