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
| Slack #maximus-updates channel (channel-sync) | 2026-07-24 22:00 PDT | 2026-07-23 22:00 PDT → 2026-07-24 22:00 PDT | 4 messages (0 threads with replies found — no reply-count indicators on any message in this window) | Cursor for bin/run_channel_sync.sh (see prompts/channel_sync.txt.tmpl). `last_ts: 1784935153.493059` (Action Items update, Fri Jul 24 @ 4:19 PM PDT — now the newest message in the channel). Processed 4 messages spanning Jul 24 7:34 AM PDT (Daily AM Brief) through Jul 24 4:19 PM PDT (Action Items update): Daily AM Brief (7:34 AM), Friday Weekly Review (2:14 PM), a draft Team-Weeklies Notion post awaiting Brandon's go-ahead (3:03 PM, not yet sent — no memory write, it's a pending draft not a confirmed fact), and an Action Items recap (4:19 PM). Real signal extracted: (1) Browserbase — Daniella Seim's financial sign-off now confirmed (~2 PM PT, per Andrew Adams) and Allison Hess ready to upload to Zip, narrowing the remaining blocker to Ashby's Ironclad approval (EAIT-4267) + services start-date decision; (2) GustoPro/Jeremy Grasso strategy follow-up slipped from its earlier Jul 21 commitment to a now-confirmed Jul 28, 1:00 PM PT; (3) Diomedes — Brandon's self-authored Weekly Review surfaced a specific Crossbeam overlap figure (~2.2K shared accounting-firm customers, ~50% overlap sensitivity-adjusted) underlying the customer-overlap figure Brandon Swartz had already flagged in the Jul 24 DM-sweep pass. Skipped as already-reflected: Browserbase counter-redlines acceptance by Cindy (already captured in COM-022 from the 2026-07-24 weekly sweep), Diomedes Buy verdict/Crossbeam-invite risk (DEC-016, action_items.md), MidDesk ~Jul 27 POV due date (already in COM-020), stale "Astrid" reference in the bot's Quick Hits (known bot error, correction already recorded — see action_items.md/projects.md, not re-litigated). Writes: commitments.md (COM-022), partners.md (Browser Base), projects.md (GBC/Browser Base, GustoPro, Diomedes). Does not walk history back to 2026-05-21 — see memory-sync design note below re: separate one-time historical backfill. |

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
