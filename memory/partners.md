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
- **Next milestone:** Quinn call 2026-07-14 — listening/positioning session on Middesk's headless API blockers; do not commit to build timeline; request formal renewal asks in writing. Jessica Sacks providing churn/attrition data + stack-ranked wishlist beforehand (COM-011).

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
- **Status:** POC in progress — ongoing
- **Classification:** Vendor (Ashby direction: treat as vendor, explore with Andrew Adams)
- **Key contact:** Unknown (Alex Kehayias managing POC; Brandon to engage Andrew Adams)
- **Strategic direction:** If go → pilot → target first-party readiness ~Dec 1, 2026
- **Next milestone:** Brandon to connect with Andrew Adams week of May 26 to explore further.

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
