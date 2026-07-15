# External Dependencies / Partners

_Last updated: 2026-05-21_

---

## Active / Critical

### Mid-desk
- **Area:** GBC – State Tax Registration (STR)
- **Status:** Active — critical dependency
- **Relationship owner (day-to-day):** Chris Elkins
- **Brandon's role:** Strategy, contract renewal
- **Current pricing:** $35/registration, ~82% margin to Gusto. Renewal ask expected at $70 (2x) or $105 (3x) — team comfortable accepting ~$70; $105 warrants negotiation. Andrew's read: they'll be "thrilled" at $50.
- **Contract:** November 2026 renewal. **Renewal notice window closes ~July 28, 2026** (90-day notice, confirmed — was previously an estimate).
- **Key risks:**
  - Pricing likely to increase significantly upon renewal (confirmed ask range $70–105)
  - Andrew Adams back-channeling Gusto's first-party plans to mid-desk contacts
  - Mid-desk aware of Mosey acquisition and GBC first-party intent
  - Potential scaling/POA compliance issues in certain states (e.g., Hawaii)
  - Mid-desk may push for payroll closure / additional integrations as leverage
- **Strategic direction:** Multi-provider strategy. First-party STR target: first 100 customers (CA only) by Aug/Sep 2026, FL/TX/NY next cycle; cost target ~$3.50/registration vs. $35 to mid-desk. GBC launch Oct 1, 2026 is the hard deadline driving urgency. Get Palm as optionality. Negotiation strategy: accept modest price increase in exchange for contractual teeth (SLA penalties/invoice credits), order status transparency, clearer escalation protocols, and Karen's (Middesk's internal decision-maker) explicit buy-in — not just Quinn/Lolo alignment.
- **Quinn call held 2026-07-14, 11 AM–12 PM PT — went well (see DEC-009):** Middesk verbally committed to headless API delivery by 10/1/2026 (same window as GBC's own Oct 1 launch target — worth watching whether Middesk's date is a dependency or just a coincidence) and proposed co-build/co-design sessions for parallel build (COM-015 — Chris to align cadence with Lolo). On pricing, Quinn signaled a platform fee is more likely than the previously expected 2–3x per-registration hike ("not coming for our margins") — softer signal than the $70–105 ask the team had prepped for, but not yet a formal ask. Karen-alignment gap confirmed directly by Quinn (commits, but execution scrambles — PFMLs cited as the live example); renewal being used explicitly to force that alignment. Jessica's stack-ranked wish list never arrived before the call (COM-011) but didn't appear to hurt — churn stats alone sufficed as leverage.
- **Next milestone:** Get Middesk's 10/1 headless-API commitment and any platform-fee proposal in writing (still verbal only — COM-016). Renewal notice window still closes ~Jul 28, 2026 (DEC-007) — that's the next hard deadline, not this call.
- **Jessica's counter-read on the Quinn call (Slack, Jul 14, 1:22 PM PT):** Pushback on treating the good call as signal — she had a similarly warm lunch with Quinn/Lolo a couple months ago that didn't move PFML/locals or aged-order execution. Her pattern read: Quinn/Lolo are strong at account management (creates "warm fuzzies") but that doesn't connect to execution; Middesk tends to name solvable problems as blockers Gusto should accept rather than building the moat to solve them — e.g. PFML states requiring bio ID verification (Middesk initially claimed they couldn't do it; Chris pushed back citing CorpNet had serviced those orders) and LPOA-requirement states (7+ months no progress despite being a clear differentiation opportunity if solved). Her ask: structure the renewal contract with real teeth so Gusto doesn't keep having to ask nicely or threaten contract-breaking to get delivery — make Gusto/this relationship Karen's top priority, not just Quinn/Lolo's.
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
- **Social dynamics:** Quinn/Lolo are described as "consistently at odds" with Karen internally at Middesk — reinforces why renewal terms need Karen's explicit buy-in, not just warmth from the account team.
- **Refined churn stat (Jessica, Slack Jul 13, more granular than previously logged):** CX outreach for a Middesk-specific problem raises churn risk 1.6x; CX outreach for *any* tax issue raises it 1.5x — i.e., Middesk-specific issues carry a further +0.1x on top of the general tax-support baseline, though Jessica notes this may partly reflect current CX org tenure, not purely a Middesk effect.
- **Agreement summary doc (Chris, Slack Jul 13):** Full agreement + summary shared at https://drive.google.com/drive/folders/1kNn3s0EeqXO-fOtilAr5S7jdO2sCIaKV — Jessica's task is to go through it and "ruthlessly" stack-rank the wishlist into realistic asks vs. a "when hell freezes over" pile (parking lot, not killed — items can resurface).
- **Negotiation posture / margin philosophy (Jessica, internal prep):** Team is tracking ARR/top-line, not margin, right now — she's explicitly willing to concede on price if it buys real speed/quality/reliability improvements, since those are what actually move the churn numbers the team is measured on.
- **Timeline confirmed (internal prep, Jul 13):** ~11 days from prep call to Middesk's notice deadline (consistent with the Jul 24 window in DEC-007), giving roughly 3 weeks total to land a negotiating position. Brandon to draft a philosophical-level negotiation POV for Chris/Jessica/Andrew to react to over the next ~2 weeks.

---

### Zen Business
- **Area:** SYB + Entity Management — EIN, LLC formation, registered agent, initial reports
- **Status:** Active — at least 1 more year
- **Relationship owner:** Farron Hicks (product); Brandon (partner dev)
- **Contract:** No exclusivity clause blocking first-party build. Review exact language.
- **Key risks:** Ransomware attack (March 2026) — DPA was inadequate; amendments signed. Template fix in progress.
- **Strategic direction:** Browser base POC may reduce dependency. First-party entity formation a medium-term goal.
- **Next milestone:** EIN going GA (AB test complete); browser base go/no-go.

---

### Browser Base
- **Area:** GBC + SYB – first-party state tax registration + entity formation
- **Status:** Agreement in final procurement stage — go decision effectively made. Security/GRC review (Jun 18, with Shubhankar, Cindy, Nick, Hannah Mullally) cleared major technical hurdles: session data ephemeral by default, BYOS writes direct to Gusto's S3, isolated VM per session, RBAC + SSO available. Gap: no BYOS for session recordings/CDP logs yet (slated this quarter) — workaround is disabling both for sensitive workflows.
- **Contract economics (confirmed on 2026-07-13 vendor call):** $18K/year upfront as credits (browser hours $0.10/hr, proxies $10/GB, model gateway at cost). Room to negotiate contract size.
- **⚠️ Open decision — DPA threshold:** Browserbase only accepts a customer's own DPA at $60K+/year; the current $18K deal falls below that line. Choice is: stay at $18K and use Browserbase's DPA, or increase to $60K+ and use Gusto's DPA. Brandon meeting with counsel 2026-07-13 to decide. Cindy sending Browserbase's DPA for review.
- **Classification:** Vendor. Brandon is lead (Zip #5888), shepherding the deal but not the end signer.
- **Key contacts:** Shubhankar, Cindy (Browserbase). Eddie (external stakeholder, eager to close, pinged Brandon the week of Jul 6).
- **Open negotiation items (red lines sent to Cindy 2026-07-13):** No auto-renew (explicit opt-in only); indemnity language (lawyers to handle); no marketing use of Gusto name/logo without written consent; 48-hour breach notice; data minimization confirmed configurable; exclude user contributions from content license grant. Allison Hess (legal) reviewing agreement as of Jul 6.
- **Strategic direction:** Agentic fulfillment vehicle for first-party STR (state closures = proving ground) and entity formation. Target first-party readiness ~Dec 1, 2026.
- **Next milestone:** Close by end of July 2026 (originally targeted for 2026-07-13, slipped due to DPA/economics decision). Awaiting Browserbase's DPA from Cindy; DPA-threshold decision with counsel.

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
