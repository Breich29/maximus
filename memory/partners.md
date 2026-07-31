# External Dependencies / Partners

_Last updated: 2026-07-29 (channel sync)_

---

## Active / Critical

### Mid-desk
- **Area:** GBC – State Tax Registration (STR)
- **Status:** Active — critical dependency
- **Relationship owner (day-to-day):** Chris Elkins
- **Brandon's role:** Strategy, contract renewal — **Brandon drives and owns the renewal strategy and negotiating position outright** (confirmed by Brandon Jul 15). Chris (day-to-day relationship + execution), Jessica (product/tax input, churn data), and Andrew (GBC/first-party input) are inputs into Brandon's strategy, not co-owners of it — do not frame their contributions as shared strategic ownership in briefs or docs. Consistent with the general partner-lifecycle handoff rule already in Chris's stakeholder note: Brandon owns pre-contract and renewal/termination; Chris owns post-launch steady state.
- **Current pricing:** $35/registration, ~82% margin to Gusto. Renewal ask expected at $70 (2x) or $105 (3x) — team comfortable accepting ~$70; $105 warrants negotiation. Andrew's read: they'll be "thrilled" at $50.
- **Contract:** November 2026 renewal. **Renewal notice window closes ~July 28, 2026** (90-day notice, confirmed — was previously an estimate).
- **Key risks:**
  - Pricing likely to increase significantly upon renewal (confirmed ask range $70–105)
  - Andrew Adams back-channeling Gusto's first-party plans to mid-desk contacts
  - Mid-desk aware of Mosey acquisition and GBC first-party intent
  - Potential scaling/POA compliance issues in certain states (e.g., Hawaii)
  - Mid-desk may push for payroll closure / additional integrations as leverage
- **Strategic direction:** Multi-provider strategy. First-party STR target: first 100 customers (CA only) by Aug/Sep 2026, FL/TX/NY next cycle; cost target ~$3.50/registration vs. $35 to mid-desk. GBC launch Oct 1, 2026 is the hard deadline driving urgency. Get Palm as optionality. Negotiation strategy: accept modest price increase in exchange for contractual teeth (SLA penalties/invoice credits), order status transparency, clearer escalation protocols, and **Quinn's** explicit buy-in as the actual decision-maker (corrected by Brandon Jul 15 — Karen does not hold final authority; she's an internal execution-side stakeholder, not the decision-maker. See people.md.).
- **Quinn call held 2026-07-14, 11 AM–12 PM PT — went well (see DEC-009):** Middesk verbally committed to headless API delivery by 10/1/2026 (same window as GBC's own Oct 1 launch target — worth watching whether Middesk's date is a dependency or just a coincidence) and proposed co-build/co-design sessions for parallel build (COM-015 — Chris to align cadence with Lolo). On pricing, Quinn signaled a platform fee is more likely than the previously expected 2–3x per-registration hike ("not coming for our margins") — softer signal than the $70–105 ask the team had prepped for, but not yet a formal ask. Internal execution-alignment gap (involving Karen) confirmed directly by Quinn (Quinn commits, but execution scrambles — PFMLs cited as the live example); renewal being used explicitly to force that alignment. Jessica's stack-ranked wish list never arrived before the call (COM-011) but didn't appear to hurt — churn stats alone sufficed as leverage.
- **Next milestone:** Get Middesk's 10/1 headless-API commitment and any platform-fee proposal in writing (still verbal only — COM-016). **Renewal notice window closed 2026-07-28 (DEC-007) without Brandon's negotiation POV having been sent to Chris/Jessica/Andrew (COM-020, now 2 days overdue as of Jul 28 evening)** — MidDesk is now setting renewal terms without Gusto's framing in place.
- **Date-language discrepancy (flagged 2026-07-17) — resolved 2026-07-23:** Confirmed consistent across every brief through Jul 23 night-before-prep: the 90-day notice window **opens Jul 24** and **closes ~Jul 28** — same window, described from its two ends, not a conflicting date. No further clarification needed from Brandon.
- **POV status as of 2026-07-23, 9:10 PM PT (COM-020):** Still not started — window opens the next morning (Jul 24). Flagged as the top-priority open item across every brief since Jul 13. Chris/Jessica/Andrew remain the intended reviewers once a first draft exists. Lolo<>Chris<>Brandon coffee held 2026-07-22, 2:00 PM PT as the last pre-window signal, but no recap/outcome had synced into #maximus-updates as of the Jul 23 briefs — treat as a gap to check directly with Brandon or Chris, not as "no new signal."
- **POV status update, 2026-07-28 9:11 PM PT (Night-Before Prep):** Still not sent — the 90-day notice window that opened Jul 24 closed today (Jul 28) without it. Now 2 days overdue against the ~Jul 27 due date. Next forcing function per the brief: get it out before the 9:30 AM PT Jul 29 Ashby/Igor "AI Disc. Continued" sync.
- **POV status update, 2026-07-29 9:13 PM PT (Night-Before Prep):** Still not sent — the Jul 29 9:30 AM Ashby/Igor forcing function passed without it happening. Now 5 days overdue against the ~Jul 27 due date. Next forcing function per the brief: first task Jul 30 AM ("if you do only one thing first thing tomorrow: Write the MidDesk negotiation POV").
- **Jessica's counter-read on the Quinn call (Slack, Jul 14, 1:22 PM PT):** Pushback on treating the good call as signal — she had a similarly warm lunch with Quinn/Lolo a couple months ago that didn't move PFML/locals or aged-order execution. Her pattern read: Quinn/Lolo are strong at account management (creates "warm fuzzies") but that doesn't connect to execution; Middesk tends to name solvable problems as blockers Gusto should accept rather than building the moat to solve them — e.g. PFML states requiring bio ID verification (Middesk initially claimed they couldn't do it; Chris pushed back citing CorpNet had serviced those orders) and LPOA-requirement states (7+ months no progress despite being a clear differentiation opportunity if solved). Her ask: structure the renewal contract with real teeth so Gusto doesn't keep having to ask nicely or threaten contract-breaking to get delivery — make Gusto/this relationship a top priority for whoever internally needs to prioritize it to get better execution (Jessica's original phrasing named Karen specifically, but per Brandon's Jul 15 correction, Quinn — not Karen — holds actual decision authority on the renewal).
- **Invoice-credits negotiation lever (originated in internal prep, Jul 13, before being floated again Jul 14, 1:32 PM PT Slack):** "Carrot and stick" contract mechanism — tie the pricing increase to earned maturity rather than a flat hike ("if you want $50/registration, you have to earn it"). Direct response to Jessica's teeth ask above. Not yet developed into a formal proposal or run past Chris/Jessica for reaction.
- **Most Favored Nation (MFN) clause — Andrew's flag (internal prep, Jul 13):** Pushing pricing toward $50–70 likely requires Gusto to waive its MFN clause, since Middesk registers for Rippling at $35 today. Andrew and team comfortable waiving this long-term in exchange for the pricing/teeth tradeoff.
- **Contract-writing process lesson (Chris, internal prep):** The locals/PFML amendment took as long to negotiate as it would have taken to build the feature, and Gusto reacted to Middesk's draft paper rather than leading with its own. For this renewal, start from Gusto's own must-haves/nice-to-haves position paper first, rather than responding to their draft.
- **Billing-timing / deposit idea (internal prep):** Middesk has floated wanting to bill Gusto once they're confident the customer (not Middesk or the state) is the blocker on a stalled order. Chris's counter: if anything, structure it so Middesk/Gusto can bill the *customer* in that scenario, not each other — and separately, consider experimenting with an upfront (refundable) customer deposit model similar to SYB's, to de-risk the same dynamic. Both ideas are informal, not yet proposed to Middesk.
- **CX-cost leverage point (Andrew, internal prep):** Middesk's own CX team supporting Gusto has grown from ~1.5 to ~6 people. If Gusto absorbs more volume via the headless API, that's a direct cost reduction for Middesk's CX org — worth surfacing explicitly in negotiation, since Middesk's own sales lead reportedly wants that load off their plate.
- **Order backlog, more granular (internal prep, pre-dates and consistent with the "3,000 CorpNet orders" figure elsewhere, which is a separate/older stat):** ~7,000–8,000 Middesk orders in non-terminal status. ~2,000 are customer-abandoned questionnaires (Jessica: not a real pain point — "someone went shopping and decided not to buy"). ~5,000 are stuck post-government-submission with unclear blocker ownership (Middesk vs. state) — this is the actual churn-risk long tail worth pushing on.
- **Negotiation tactic — premium rate for early registrations in a new locality:** Modeled on the Rippling precedent (first 10 registrations exempted from standard SLA, paid at a premium rate) — pay a higher rate for the first ~5 registrations in a given locality to acknowledge setup effort, reverting to normal rate/SLA once established.
- **Scope philosophy on locals coverage (Jessica):** ~12 locals cover ~70% of market need; chasing the long tail of the full ~2,500 locals has rapidly diminishing returns. Priority should be raising the quality/speed bar on core high-volume states (e.g., Arizona's SLA gap) over full long-tail local coverage — even though the PFML/locals amendment technically already commits Middesk to 100% coverage.
- **Open question, not yet analyzed:** Chris flagged a possible hidden churn cost among accounting-partner customers (~15% of volume) if Middesk's local coverage gaps are worse for that segment than CorpNet's prior 100% coverage was — needs a data pull to confirm or rule out.
- **Technical ground-truth gap:** Quinn and Lolo are account-management, not systems experts — Andrew's explicit read is "we should not be using Lolo as the source of truth" on order-blocker questions, and Karen doesn't know the system either. **Logan and Anthony** are the actual technical contacts who understand order-status data on Middesk's side; team wants them looped into working sessions (in parallel with, not blocking, the renewal negotiation) to establish real blocker attribution (customer vs. Middesk vs. state) before making contractual commitments around it.
- **Closures product as a dangle:** Middesk is reportedly launching a "closures" product end of July — worth expressing interest as a relationship/goodwill lever without committing Gusto to anything net-new, especially given Middesk's own delivery track record on newer asks.
- **Social dynamics:** Quinn/Lolo are described as "consistently at odds" with Karen internally at Middesk. Note the correction above — this is useful context on internal Middesk friction, not evidence that Karen's buy-in is what ultimately matters for the renewal; Quinn's is.
- **Refined churn stat (Jessica, Slack Jul 13, more granular than previously logged):** CX outreach for a Middesk-specific problem raises churn risk 1.6x; CX outreach for *any* tax issue raises it 1.5x — i.e., Middesk-specific issues carry a further +0.1x on top of the general tax-support baseline, though Jessica notes this may partly reflect current CX org tenure, not purely a Middesk effect.
- **Agreement summary doc (Chris, Slack Jul 13):** Full agreement + summary shared at https://drive.google.com/drive/folders/1kNn3s0EeqXO-fOtilAr5S7jdO2sCIaKV — Jessica's task is to go through it and "ruthlessly" stack-rank the wishlist into realistic asks vs. a "when hell freezes over" pile (parking lot, not killed — items can resurface).
- **Negotiation posture / margin philosophy (Jessica, internal prep):** Team is tracking ARR/top-line, not margin, right now — she's explicitly willing to concede on price if it buys real speed/quality/reliability improvements, since those are what actually move the churn numbers the team is measured on.
- **Timeline confirmed (internal prep, Jul 13):** ~11 days from prep call to Middesk's notice deadline (consistent with the Jul 24 window in DEC-007), giving roughly 3 weeks total to land a negotiating position. Brandon to draft a philosophical-level negotiation POV for Chris/Jessica/Andrew to react to over the next ~2 weeks.
- **Update (2026-07-30, Zoom w/ Andrew Adams — DEC-017):** Brandon finally worked the overdue POV (COM-020) live with Andrew, ahead of sending a draft to Chris/Jessica — not yet sent to them, still a two-person working session. Five "big rocks," in Brandon's priority order: (1) codify in contract the already-practiced billing trigger (no billing until state submission confirmed); (2) reframe non-terminal order aging away from "SLA" language into quality thresholds + outcome obligation, tied to a volume carrot — Gusto sources only ~27% of order volume from its own Middesk-eligible population today, wants 40%+, with ~70% adoption positioned as something Middesk has to earn; (3) positioning frame for the whole negotiation: "make it so obviously good that it'd be a dumb business decision for Gusto to build this internally" (Andrew's own line to Quinn on Mosey/SDR); (4) real-time bidirectional health metrics + a staged escalation ladder (proactive written notice on threshold breach → remediation period → state shutoff if unresolved → termination only as a last, staged step) modeled on the GEP/Xero precedent; (5) headless API/PFML — committed dates with invoice credits for every month missed if Gusto uses the limited-power-of-attorney (LPOA) approach; Brandon flagged this as the one Quinn won't like and Andrew is skeptical it's fully feasible everywhere (Gusto may be the blocker to headless in some states) — needs more diligence before locking the ask. Full detail in vault `10-Partners/Middesk.md`.
- **⚠️ Embargoed internal reorg (not yet announced, expected public ~Jul 31–Aug 3 — do not surface to Middesk or outside the core team):** Andrew Adams is set to become PM of a new "State Tax Registration & Closure" (STRC) team forming inside Entity Management, taking over Middesk product/operational ownership from Jessica Sacks/Tax Experiences — see projects.md Entity Management section. **Ownership boundary — resolved (Brandon, Jul 30):** no conflict with Brandon's Corp Dev role. Brandon supports the STRC team, and contract ownership + escalation paths for Middesk is that support function — same model as his other four areas (product owns the surface, Brandon owns strategy/contracts/renewals for the partner). "No changes to Partnerships support" in the reorg doc confirms this, it isn't a separate carve-out.
- **Accountability-matrix idea (open, undecided, 2026-07-30):** Brandon wants Middesk commitments validated above Karen's level (her manager, Drew — last name unknown) so they can't be walked back as "just Karen." Separately floated, undecided: escalate Karen performance concerns to Quinn's chain via Ashby (lands sterner) rather than Tomer (seen internally at Middesk as a friendly/possibly-investor relationship). Andrew's characterization (unverified, transcript-sourced — treat with the same caution as the Karen-decision-maker correction below): Drew is disengaged and over-invested in defending Karen (his first hire); Quinn/Lolo reportedly want her out but Andrew doubts it's imminent; her deputy Sophia gave notice Jul 29.
- **DRI named in writing (2026-07-29, Andrew Adams' Notion doc "Middesk contract renegotiations," surfaced in the 2026-07-30 AM Brief):** Andrew formally tagged Brandon as DRI on the renewal negotiation — consistent with, and now documented alongside, the "Brandon drives and owns the renewal strategy" framing above. With the notice window closed Jul 28 and the POV still not sent to Chris/Jessica as a group (COM-020/DEC-017), this reads as Andrew waiting on Brandon's lead.

---

### Zen Business
- **Area:** SYB + Entity Management — EIN, LLC formation, registered agent, initial reports
- **Status:** Active — at least 1 more year
- **Relationship owner:** Farron Hicks (product); Brandon (partner dev)
- **Contract:** No exclusivity clause blocking first-party build. Review exact language.
- **Key risks:** Ransomware attack (March 2026) — DPA was inadequate; amendments signed. Template fix in progress.
- **Strategic direction:** Browser base POC may reduce dependency. First-party entity formation a medium-term goal.
- **Next milestone:** EIN going GA (AB test complete); browser base go/no-go.
- **Term Sheet Sync (2026-07-17, Lars Wensel — new contact):** Two new SKUs proposed via contract amendment. **Operating Agreement** — $99 retail (matches EIN pricing), Brandon's priority/real revenue driver. **Publication** — pass-through cost, no margin (3rd-party vendor); existing prepaid state-fee bucket needs an addendum to cover newspaper publication fees; Lars open to Brandon sourcing a cheaper direct vendor. Path: non-binding term sheet → Brandon confirms by email → Lars submits legal ticket → addendum → signatures. **Goal: close before end of July 2026** — same window as the Mid-desk renewal notice deadline (~Jul 28), competing for Brandon's time. **Risk carried from vault note:** new SKUs expand Section 3.1 exclusivity footprint — check against first-party SYB build strategy before confirming by email.

---

### Browser Base
- **Area:** GBC + SYB – first-party state tax registration + entity formation
- **Status:** **Signed and closed — 2026-07-29.** DocuSign completion email received 5:40 PM PT confirming all parties signed; end-of-July close target met. Security/GRC review (Jun 18, with Shubhankar, Cindy, Nick, Hannah Mullally) cleared major technical hurdles: session data ephemeral by default, BYOS writes direct to Gusto's S3, isolated VM per session, RBAC + SSO available. Gap: no BYOS for session recordings/CDP logs yet (slated this quarter) — workaround is disabling both for sensitive workflows.
- **Contract economics (confirmed on 2026-07-13 vendor call):** $18K/year upfront as credits (browser hours $0.10/hr, proxies $10/GB, model gateway at cost). Room to negotiate contract size.
- **⚠️ Open decision — DPA threshold:** Browserbase only accepts a customer's own DPA at $60K+/year; the current $18K deal falls below that line. Choice is: stay at $18K and use Browserbase's DPA, or increase to $60K+ and use Gusto's DPA. Cindy's DPA received and reviewed/approved by Brandon (COM-013, closed 2026-07-20) — feeds into the 2026-07-21 Allison Hess redlines review below; threshold decision itself not yet confirmed closed.
- **Classification:** Vendor. Brandon is lead (Zip #5888), shepherding the deal but not the end signer.
- **Key contacts:** Shubhankar, Cindy (Browserbase). Eddie (external stakeholder, eager to close, pinged Brandon the week of Jul 6).
- **Open negotiation items (red lines sent to Cindy 2026-07-13):** No auto-renew (explicit opt-in only); indemnity language (lawyers to handle); no marketing use of Gusto name/logo without written consent; 48-hour breach notice; data minimization confirmed configurable; exclude user contributions from content license grant. Allison Hess (legal) reviewing agreement as of Jul 6.
- **⚠️ Additional risks reconciled from vault `10-Partners/BrowserBase.md` (2026-07-20 — not previously captured here):**
  1. **Uncapped customer indemnity** — current draft exposes Gusto to unlimited liability for customer-side issues; non-standard, needs an explicit cap before MSA signature. (The "indemnity language" red line above was tracked vaguely as "lawyers to handle" — this is the specific defect.)
  2. **Policy-based blocking risk** — Browserbase's own Acceptable Use Policy may technically prohibit the exact STR-account-closure automation Gusto is contracting for. Fundamental contract risk, not yet resolved, must be confirmed before MSA execution.
  3. **Intuit T&C / IP language clearance is a shared blocker** — per vault, the same clearance (DRI: Allison Hess) blocks both this Browserbase MSA *and* the Double/Project Diomedes term discussions (see projects.md Diomedes entry). Status of this clearance not confirmed as of 2026-07-20 — worth checking both threads together rather than assuming independent timelines.
- **Strategic direction:** Agentic fulfillment vehicle for first-party STR (state closures = proving ground) and entity formation. Target first-party readiness ~Dec 1, 2026.
- **Next milestone:** Close by end of July 2026 (originally targeted for 2026-07-13, slipped due to DPA/economics decision). DPA received/approved (COM-013 done); counter-redlines sent and **accepted by Browserbase** (per Brandon's Jul 23 11:17 AM PT DM to Allison Hess). Remaining blockers are now internal: Daniella Seim's financial sign-off (FBOS – Pay Group/Solo/Entity Management) and Ashby's Ironclad procurement approval (ticket EAIT-4267, nudged by Brandon Jul 24). See COM-022.
- **2026-07-21, 11:30 AM redlines review with Allison Hess — held (see DEC-015, COM-022):** Most positions accepted as commercially fine (indemnification, liability caps, 72hr breach notice, publicity rights, audit frequency). Three redlines remain for Allison to action: strike "promoting"/"marketing" from §3.3 permitted data uses, add subject-level de-identification language to §3.3, strike Gusto's breach-investigation-cost obligation in §11.3. §3.3 marketing-use position flagged to escalate to leadership before sending back to Browserbase. **Not addressed in this session** — still open: the policy-based blocking risk (Browserbase's Acceptable Use Policy may prohibit the STR-account-closure automation Gusto is contracting for) and the shared Intuit T&C/IP clearance blocker with Diomedes (same DRI, Allison Hess).
- **Update (2026-07-24, DM threads — Brandon<>Andrew Adams, Brandon<>Allison Hess, Brandon<>Ashby Taylor):** Chris Elkins gave internal green light on the deal ("We got the green light from Chris on BB" — Andrew Adams). Andrew now needs to decide the Browserbase service start date (8/1 vs. 9/1), which is linked to hiring a contractor to help execute the work — Andrew flagged "not sure how quick contractors spin up" as a reason to consider pushing the date. Cindy (Browserbase) separately reached out with next steps: needs signer name/email + preferred "Service Term Commencement Date" to send the DocuSign. Deal is functionally done on commercial terms; what's left is internal sign-off sequencing (Daniella Seim, Ashby/Ironclad) before execution.
- **Update (2026-07-24, ~2 PM PT, per Andrew Adams via #maximus-updates channel):** Daniella Seim's financial sign-off is now confirmed (✓). Allison Hess is ready to upload the agreement to Zip. Remaining blocker narrowed to Ashby's Ironclad procurement approval (ticket EAIT-4267) plus the services start-date decision (8/1 vs. 9/1). End-of-July signature target reaffirmed as realistic per Brandon's Friday Weekly Review (Jul 24).
- **⚠️ New flag (2026-07-27 evening, Zip ticket #5888 / browserbase-partnership-2026):** Three Zip notifications reported "All vendor tasks complete" ✅, but the **IT Approval and CFO Approval steps were both removed** "because the request details changed." Not yet clear whether this is routine (deal amount below the CFO-approval threshold) or reflects an actual scope change. Needs clarification from Allison Hess or Andrew Adams — surfaced ahead of the 2026-07-28 10:00 AM Corp & Partner Dev weekly. Services start-date decision (8/1 vs. 9/1) still unresolved as of this update.
- **Update (2026-07-28):** End-of-July signature target day (Jul 28) passed without confirmed signature. Daily AM Brief (Jul 28) surfaced a new Zip ticket #5888 detail: **"Jhett Blasco auto-approved"** the same step after the IT Approval and CFO Approval gates were removed overnight — still needs an explanation from Allison Hess or Andrew Adams. Night-Before Prep Brief (Jul 28, 9:11 PM PT) confirms still not signed as of end of day; Jul 29 and Jul 30 (Thursday) flagged as the last shots before August. Services start-date decision (8/1 vs. 9/1) remains unresolved.
- **Update (2026-07-29, 5:40 PM PT) — SIGNED AND CLOSED:** DocuSign completion email confirms all parties signed. End-of-July close target met (see commitments.md COM-022, now Completed). The "Jhett Blasco auto-approved" step from the Jul 28 flag was never explained but did not block signature. One administrative item remains: confirm the services start date (8/1 vs. 9/1) with Andrew Adams so Allison Hess can finalize it in Zip. **Not resolved by this signature:** the policy-based blocking risk (Browserbase Acceptable Use Policy vs. STR-account-closure automation) and the shared Intuit T&C/IP clearance blocker with Diomedes remain open.
- **Update (2026-07-30, ~10:07 PM PT, Zip notifications):** Zip PO #5888 fully approved and sent — deal is administratively closed on Gusto's side. Only the services start-date confirmation (8/1 vs. 9/1) with Andrew Adams remains before Allison Hess can finalize it in Zip. **Note:** the same-day AM Brief and a same-day Channel Scanner post both separately described a "DocuSign completed Jul 30, 12:40 AM PT" signing event — 7 hours off from the already-recorded Jul 29 5:40 PM PT completion in COM-022. Treated as the bot restating the same signing event with a timestamp/timezone slip, not a second signature; COM-022's original Jul 29 5:40 PM PT timestamp is retained as authoritative. Flag to Brandon if a genuinely separate Jul 30 signing event is confirmed.

---

### Legal Link (owned by Legal Zoom)
- **Area:** Entity Management – registered agent
- **Status:** Active
- **Relationship owner:** Currently Alex Kehayias (Brandon to be introduced)
- **Key risks:** SLA adherence issues (tracked by Becky Grant, Farron's head of ops). No binding SLA commitments in current contract.
- **Fallback:** Computer Share (same team as former CorpNet people; performance inferior to Legal Link)
- **Next milestone:** Alex to intro Brandon as relationship owner. Renegotiate SLA commitments when contract allows.

---

### Earth Class Mail / Stable
- **Area:** Entity Management – physical mail
- **Status:** Active
- **Earth Class Mail:** Primary (owned by Legal Zoom). Stripe is payment processor for this surface.
- **Stable:** Fallback. Has accepted Gusto's legal opinion on mail scanning compliance.
- **Key risks:** Gusto is not largest customer (Stripe Atlas is). Responsiveness issues with contacts.
- **Next milestone:** No immediate action. Monitor SLAs.

---

### Get Palm
- **Area:** GBC + SYB – potential 3rd-party STR and/or entity formation provider
- **Status:** Exploratory — initial meeting completed May 23
- **Key contacts:** Connor (last name unknown, Brandon's contact — likely oversharer, useful for intel); Helen (sent API docs post-meeting)
- **Company size:** ~20–50 employees. Doing a lot at once, not super focused.

**Products (all à la carte, API-first):**
- **Onboard:** Business search + verification (live)
- **Verify:** KYB/KYC with risk levels + compliance checks (live)
- **Monitor:** Subscription-based change tracking — ownership, filings, liens, adverse actions (live)
- **Comply:** Action on monitoring alerts — annual reports, DBAs, S-corp filings (live)
- **Entity formation:** All 50 states, LLCs/corps/professional entities — launching in next couple weeks
- **STR (state tax registration):** In development pipeline
- **Registered agent:** Through state partners; considering in-house

**Gusto fit analysis:**
- Compare Palm APIs vs. Mosey's current methods (cheaper/better/faster — need 2 of 3)
- Monitor/Verify APIs: evaluate with Gusto risk team
- Entity formation: highly relevant to SYB first-party spike — Izzy hasn't seen anyone doing e2e with minimal humans
- Comply: potentially relevant to GBC annual reports / foreign qualifications

**Strategic angle:** May be a 6–12 month rental while Gusto builds first-party. Worth understanding what's a huge lift vs. what could be rented short-term.

**Next steps:**
- Helen to send API docs + entity formation documentation (awaiting)
- Brandon to pass docs + notes to Alex to kick the tires (COM-001)
- Brandon to email Connor for lunch/dinner — extract how they built entity formation (COM-010)
- Gusto risk team to evaluate Monitor/Verify APIs

**Next milestone:** COM-001 (pass to Alex, week of May 26). COM-010 (email Connor, week of May 26).

---

---

### Curative
- **Area:** Solo Health Insurance
- **Status:** Exploratory — partnership potential
- **Current state:** Powers Lettuce's solo PEO offering (not all 50 states)
- **Relationship owner:** Stephanie Liu (Solo PM), Brandon (partner exploration)
- **Competitive context:** Lettuce built solo PEO using Curative, 10% → 50% adoption, 5K solos at Summit
- **Gusto gap:** 0.3% health insurance attach for solos vs. 16-26% for other plans; current Stride referral minimal revenue
- **Strategic direction:** Exploring solo insurance marketplace — multiple options (HBG Solo captive, Curative, Catch, ICHRA, MEC plans)
- **Next milestone:** Stephanie to engage Curative (with Vivian); Aaron (prior health insurance analyses) to help scope paths + limitations; Brandon + Stephanie consolidating strategic one-pager

---

## Inactive / No Longer Tracking

| Partner | Area | Reason |
|---|---|---|
| HiBob | HR integration | No longer relevant to Brandon's scope |
| Studio Designer | Design software | No longer relevant |
| BQE | Accounting software | No longer relevant |
| Lettuce Financial | Accountant platform | Competitive threat (solo PEO via Curative) — monitoring, not partnering |
| Melio | AP/AR platform | No longer relevant |
| Imprest.ai | Expense mgmt | One-off intro meeting only |
| CorpNet | State tax registration | No revival — too much engineering/CX overhead |
