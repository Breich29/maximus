# Extraction Tracker

_Tracks last scan timestamps per source to avoid re-processing and enable incremental updates._

---

| Source | Last Scanned | Window Covered | Records Processed | Notes |
|---|---|---|---|---|
| Slack DMs (from:me / to:me) | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-24 (7-day pass, 3 pages/~60 results per direction — heavy Jul 24 volume meant paginated coverage reached back to ~Jul 23 11:00 AM in depth; earlier-week days assumed lower-signal based on no new names surfacing in the pages read, consistent with the deferred-backfill posture already established for this job) | ~120 messages scanned, 5 new DM contacts | New DM contacts found and added directly to people.md: Tyrone Guillory Jr. (Procurement), Kinzi Top (Technical Solutions PE), Jeremy Grasso (BD & Alliances — resolves a pending-confirmation flag), Sam Haber (Gusto Embedded Product), Joseph Barrientos (personal/social). Substantive project signal: Browserbase deal green-lit internally (Chris Elkins), awaiting Daniella Seim sign-off + Ironclad approval — written to commitments.md/partners.md/projects.md/people.md. Ambiguous Izzy Rogner-Hall ownership-transfer signal flagged to action_items.md, not resolved into projects.md. Prior pass (2026-07-17) found Delia He, Phil Tesorero. Note: the search tool's inline result timestamps are malformed/unusable — cross-validated against `slack_read_channel`, which returns correct real timestamps. |
| Slack mentions (to:<@UCBUECCKF>) | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-24 (2 pages read, dominated by Jul 24 same as DM scan) | ~40 messages scanned | No new people beyond DM scan overlap. Confirmed Diomedes financial-model working session (Delia He/Brandon Swartz/Ashby Taylor group DM) — written to projects.md. |
| Slack user search | 2026-07-24 | n/a | 8 people looked up this pass (Tyrone Guillory Jr., Joseph Barrientos, Sam Haber, Jeremy Grasso, Kinzi Top, Daniella Seim, Colleen Oates, "cindy" disambiguation) | Prior pass (2026-07-17) backfilled Devesh Verma's Slack ID. |
| Granola meetings | 2026-05-21 | Apr 21 – May 21 (30 days) | 14 meetings listed, 3 transcripts read | Not re-run this sweep (2nd consecutive skip) — Slack #maximus-updates + Slack DM scan + calendar covered the week's signal; per-run logs show Granola has had intermittent OAuth issues (e.g. "offline" Jul 16 AM brief). Worth a direct Granola health check outside this sweep — now 2 sweeps stale. |
| Google Calendar | 2026-07-24 18:00 PDT | 2026-07-17 → 2026-07-31 (past 7d + next 7d, 100 events across 2 pulls) | 100 events | Resolved "Colleen" (AI Services Marketplace, flagged unresolved since Jul 19) to **Colleen Oates**, Head of Indirect GTM, via FY27 Roadmap × Partner Ecosystem organizer. Surfaced Elena Sharma (elena.sharma@gusto.com) as a 2026-07-28 "Firm Direct API Access" attendee alongside Kinzi Top — flagged needs-confirmation. No other new people crossing the 2+-meeting threshold identified this pass. |
| Glean org chart | 2026-05-21 | Current state | Brandon's full profile + manager chain | Title shows "Corporate Development" (updated from old role). Not re-run this sweep (optional step, skipped — see Glean org-wide scan row below). |
| Glean user activity | 2026-05-21 | PARTIAL | File 379K tokens — unreadable | Known blind spot; compensated with Granola + Slack. Not re-attempted this sweep. |
| Glean org-wide scan (per-project team search) | — | — | Skipped | Optional step skipped this pass — Slack DM/mention scan + calendar pull already surfaced high-signal new people and project updates; time budget prioritized writing those up over a supplementary Glean sweep. |
| Slack #maximus-updates channel (channel-sync) | 2026-07-28 22:12 PDT | 2026-07-27 22:00 PDT → 2026-07-28 22:12 PDT | 2 messages (0 threads with replies found — no reply-count indicators on either message in this window) | Cursor for bin/run_channel_sync.sh (see prompts/channel_sync.txt.tmpl). `last_ts: 1785298305.444999` (Night-Before Prep Brief, Tue Jul 28 @ 9:11 PM PDT — now the newest message in the channel). Processed 2 messages: Daily AM Brief (Jul 28, 7:37 AM PDT) and Night-Before Prep Brief (Jul 28, 9:11 PM PDT). Real signal extracted: (1) MidDesk negotiation POV (COM-020) — 90-day renewal notice window closed 2026-07-28 with the POV still not sent to Chris/Jessica/Andrew, now 2 days overdue; (2) Browserbase Zip ticket #5888 — end-of-July signature target day (Jul 28) passed without signing; new detail "Jhett Blasco auto-approved" the IT/CFO approval steps that were removed overnight, still unexplained; Jul 29/30 flagged as last shots before August. Flagged discrepancies (not written — bot briefs conflict with already-resolved memory, no direct Brandon confirmation to act on): COM-003 (MSA template recs → Allison Hess) shown in both Jul 28 briefs as an open commitment due "end of July," but commitments.md already has it under Completed (closed out 2026-07-20, chasing passed to Chris Elkins); COM-018 (SYB Anthropic deck → Izzy) shown as open/stale in both briefs, but commitments.md already has it Cancelled per Brandon's 2026-07-27 instruction. Skipped as already-reflected: Remote.com/Cristina Costas compliance deadline (new but ownership explicitly uncertain per the brief itself — "determine if you're the vendor DRI" — left to Channel Scanner/action_items.md per uncertain-new-signal rule, not written here); Lattice feedback requests from Izzy (lightweight ad hoc follow-up, not a formal decision/commitment); Jhett Blasco (single-mention new name, not added to people.md pending a second signal); Diomedes/Ben Stein Crossbeam agenda item for the Jul 29 1:1 (forward-looking meeting agenda, not a new decision or status change). Writes: commitments.md (COM-020 status), partners.md (Mid-desk, Browser Base), projects.md (GBC/Browser Base). Does not walk history back to 2026-05-21 — see memory-sync design note below re: separate one-time historical backfill. |

---

## Next Scheduled Scans

- **Daily brief:** Morning + night-before (per preferences.md)
- **Weekly memory sweep:** Friday 2:00 PM PT (includes a Phase 2B channel-sync catch-up if the daily job's cursor is >36h stale)
- **Channel sync (memory + Obsidian):** Daily Mon-Fri ~10:00 PM PT (bin/run_channel_sync.sh) — reads #maximus-updates since `last_ts` above and files decisions/commitments/partner+project status/people facts into memory/*.md + Obsidian. Never touches action_items.md.
- **Next DM sweep due:** 2026-07-25 (daily; weekly deep sweep next due 2026-07-31)
- **Next Granola sweep due:** overdue — last real pull 2026-05-21, 2 consecutive weekly sweeps have skipped re-running it (2026-07-17, 2026-07-24) in favor of Slack/calendar coverage. Recommend a dedicated Granola health check.

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
