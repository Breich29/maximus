# Gusto Solo — Health Insurance Command Center

**Owner:** Brandon Reich, Corporate Development – Product Partnerships  
**Date:** June 15, 2026  
**Status:** WORKING DRAFT  
**Area:** Gusto Solo

---

## The Problem in One Line

Gusto Solo has a **0.3% health insurance attach rate** against a 16–26% benchmark for comparable plans. The current Stride referral partnership is not moving the needle.

---

## 1. Current State

### The Gap
- Solo customers are among the hardest to insure: self-employed, often 1099, no employer contribution, variable income
- Gusto Solo's current health insurance offering = a **Stride Health referral link** — minimal integration, minimal revenue
- Stride is capable but the referral model keeps Gusto out of the enrollment flow and likely explains the low attach rate

### The Opportunity
- Lettuce Financial (competitor) built a solo PEO using **Curative**, achieved 10% → 50% adoption with ~5,000 solos at Summit
- That benchmark — even at 10% — is 33x Gusto's current attach rate
- Health insurance is likely a top-3 reason solos leave or don't activate on Gusto

### Key People
| Person | Role |
|---|---|
| Izzy Rogner-Hall | PM Solo + Entity |
| Namrata Jain | PE Entity + Solo |
| Janae | GTM lead (Solo-first) |
| Stephanie Liu | Solo PM (health insurance lead) |
| Aaron | Prior health insurance analyses — scope paths + limitations |
| Vivian | Engaging Curative alongside Stephanie |

---

## 2. Coverage Landscape for Solos

Health insurance options for self-employed/solo workers fall into five categories:

### A. ACA Marketplace Plans (Individual Market)
- Standard on-exchange plans via Healthcare.gov; subsidy-eligible based on income
- The "default" for solos today
- **Gusto angle:** Could offer an embedded enrollment experience rather than a referral

### B. ICHRA (Individual Coverage HRA)
- Employer (the solo's own business entity) contributes pre-tax dollars to the individual; employee uses funds to buy any ACA plan
- Solo can essentially "pay themselves" a health benefit with pre-tax dollars
- Requires the solo to have a business entity (LLC, S-corp, etc.) — **strong fit with SYB/Entity Management**
- **Regulatory:** Employer-sponsored under ERISA; not subject to ACA individual mandate
- **Gusto angle:** Highly strategic — bridges Gusto Solo + SYB + entity management in one flow

### C. Health Sharing Ministries / Communities
- Not insurance — members "crowd-fund" each other's medical bills
- Lower monthly cost (~$175–350/mo for individuals) but no ACA protections
- Pre-existing conditions often excluded or limited; not all services covered
- No network restrictions (see any provider)
- **Regulatory:** Not regulated as insurance; state-by-state legal treatment varies
- **Gusto angle:** High-demand among cost-conscious solos but carries brand/regulatory risk

### D. MEWA (Multiple Employer Welfare Arrangement)
*This section is currently empty — gap to fill.*

#### What Is a MEWA?
A MEWA is a benefits arrangement where multiple employers pool together to provide welfare benefits (health, dental, vision, life) to their employees. Governed jointly by federal ERISA and state insurance law.

#### How It Works for Solos
- A solo's single-member LLC qualifies as an "employer" — can join a MEWA as a member employer
- The MEWA pools risk across many small employers, creating group-like economics for solos
- Premiums are typically lower than individual ACA plans (no individual rate-up)
- Can offer richer benefits than individual ACA plans in some cases

#### Pros
- Group economics for solo/small employers — meaningful cost savings
- Can include employer tax deduction on premiums (vs. individual market self-employed deduction)
- More plan flexibility than ACA exchange plans
- Strong fit for associations (e.g., Gusto Solo as an association-like platform)

#### Cons / Risks
- **Regulatory complexity:** Subject to both ERISA (federal) and state insurance law — state approval often required
- **Historical fraud/underfunding risk:** MEWAs have a documented history of insolvency and fraud by bad actors; DOL actively monitors
- **Not ACA-compliant:** MEWA plans are not required to cover all ACA essential health benefits
- **Pre-existing condition protections vary:** Depends on plan design and state rules
- **State-by-state approval:** Not available in all states; multi-state MEWAs require individual state filings
- **Operational complexity:** Running or sponsoring a MEWA requires significant compliance infrastructure

#### Gusto Viability Assessment
**Medium-term consideration, not near-term.** Gusto would likely need to sponsor or white-label a MEWA, which requires insurance/compliance infrastructure Gusto doesn't have today. More realistic path: partner with an existing MEWA operator. Key question for Aaron and Stephanie: is there an established MEWA designed for freelancers/solos that Gusto could embed?

### E. Short-Term / Non-ACA Plans
- Cheaper but limited coverage; not recommended as a primary path given regulatory headwinds
- **Gusto angle:** Not recommended

---

## 3. Partner Landscape

### Current Partner

#### Stride Health *(active)*
- **What it is:** Consumer-facing benefits platform for 1099/gig workers — ACA marketplace enrollment + tax tools + portable savings account
- **How Gusto uses it:** Referral link (minimal integration)
- **Strengths:** Built for the gig/solo audience; "Official partner of HealthCare.gov"; personalized plan recommendations; 4.6M workers served; 130+ platform partners (Gusto, Uber, Amazon, DoorDash); subsidy identification
- **Weaknesses:** ACA-only (no off-exchange, no ICHRA); no employer-contribution flow; referral model keeps Gusto out of the experience
- **Result:** 0.3% attach rate — not working at current integration depth
- **Path forward:** Stride is not the wrong partner — the referral model is the wrong model. Deeper integration (embedded enrollment, in-product flow) could move attach rate materially.

---

### Exploratory Partners

#### Curative *(exploratory — high priority)*
- **What it is:** Powers Lettuce's solo PEO health offering; enables group-style coverage for solos via PEO structure
- **Why it matters:** Lettuce achieved 10% → 50% adoption using Curative with ~5K solos — the most relevant comparable
- **Fit for Gusto:** High — directly proven in solo segment
- **Next steps:** Stephanie Liu + Vivian engaging; Brandon + Stephanie consolidating strategic one-pager
- **Open question:** Does Curative cover all 50 states? What are the economics?

---

#### CrowdHealth *(to evaluate)*
- **What it is:** Health-sharing community model — members crowd-fund each other's medical bills; not ACA insurance
- **Pricing:** ~$175–350/month for individuals (training knowledge — site unreachable for live data)
- **Who it's for:** Cost-conscious solos, freelancers, younger/healthier individuals
- **Strengths:** Much lower monthly cost than ACA plans; no network restrictions (see any provider); strong brand appeal to bootstrapped solos
- **Weaknesses:** Not insurance — no ACA protections; pre-existing conditions often excluded/limited; significant regulatory caveats; not available in all states
- **Gusto fit:** Moderate — addresses the cost objection that likely suppresses attach rate, but carries brand and coverage risk; needs compliance review before any Gusto association
- **Status:** Site was unreachable during initial research — direct outreach or Stephanie/Aaron to evaluate
- **Key question:** Regulatory classification by state; what happens to a Gusto Solo customer when a claim is denied?

---

#### HealthSherpa *(to evaluate — infrastructure play)*
- **What it is:** ACA quoting and enrollment engine for agents/brokers; has a partner API (`one.healthsherpa.com`) for embedded enrollment
- **Not a consumer product** — it's the plumbing, not the brand
- **Strengths:**
  - Off-Exchange Enrollment API with explicit ICHRA support (Stride has neither)
  - 70+ carriers, 9K+ agency partners
  - Faster than Healthcare.gov (~7 min vs. 15 min enrollment)
  - Could power white-label or in-product ACA enrollment for Gusto
- **Weaknesses:** No gig-worker brand; no tax/savings/mileage features; requires Gusto to own more of the enrollment UX
- **Gusto fit:** High as infrastructure — would let Gusto embed ACA enrollment directly vs. referring out; ICHRA API is especially relevant if Gusto pursues ICHRA path (see Section 2B)
- **Stride comparison:** HealthSherpa is the engine; Stride is a branded consumer product. They're not direct replacements — Gusto could use HealthSherpa to deepen its own enrollment experience, while Stride's value is the brand + gig-worker positioning. The real question is whether Gusto wants to own the enrollment experience or stay in referral mode.
- **Status:** API program requires application/review — free to explore

---

#### Nice Healthcare *(not a fit — wrong category)*
- Primary care benefit layer (virtual visits + in-home clinicians + free labs/meds)
- Employer-sponsored only — no individual/solo enrollment
- Minnesota-based; limited state availability
- **Verdict:** Not relevant to solo health insurance distribution — possibly relevant as a supplemental benefit add-on for Gusto Solo *if* Gusto ever offers group benefits, but that's a different product question

---

## 4. Strategic Options

### Option A: Deepen Stride Integration
- Keep Stride as partner; negotiate embedded in-product enrollment (not just referral link)
- Low build cost; leverages existing relationship and Stride's gig-worker brand
- **Target:** Get Stride enrollment inside Gusto Solo onboarding flow — reduce friction to ~2 clicks
- **Risk:** Still dependent on Stride's ACA-only coverage and their conversion rates

### Option B: ICHRA + HealthSherpa
- Build an ICHRA flow (solo's LLC contributes pre-tax to individual plan)
- Use HealthSherpa's Off-Exchange API to power enrollment
- **Highly strategic:** Creates a unique Gusto product (not just a referral), drives entity formation (SYB synergy), delivers real employer tax benefit to solos
- **Risk:** Build complexity; requires Gusto to become a licensed entity or partner with one; HealthSherpa API requires review/approval
- **Timing:** Medium-term (not Q3 2026)

### Option C: Curative / Solo PEO
- Partner with Curative to offer solo PEO health coverage (the Lettuce model)
- Group economics for solos, proven 10–50x better attach rate than referral model
- **Risk:** PEO structure adds complexity; not all 50 states; economics unclear
- **Timing:** Stephanie + Vivian are already in this path — let it develop

### Option D: Health-Sharing as a "Starter" Option
- Add CrowdHealth (or similar) as a low-cost option alongside ACA plans
- Address the price objection for cost-sensitive solos
- **Risk:** Regulatory, brand, coverage gaps — needs compliance review first
- **Timing:** Only after Option A or C has a clearer path

---

## 5. Recommended Path (Draft)

**Near-term (Q3 2026):** Let Curative exploration run (Stephanie + Vivian). If economics work, that's Option C and it has the best comparable benchmark.

**Parallel:** Push Stride to deepen integration (Option A) — the partner is fine, the referral model is the problem. Get embedded enrollment in the Solo onboarding flow regardless of which longer-term path wins.

**Medium-term:** If ICHRA + entity formation becomes a Gusto product (SYB synergy), evaluate HealthSherpa API as the enrollment layer. This is the highest-upside option strategically but requires the most build.

**Defer:** CrowdHealth and MEWA paths until compliance review complete and primary path is clearer.

---

## 6. Open Questions

| Question | Owner |
|---|---|
| What are Curative's economics, state coverage, and path to partnership? | Stephanie Liu + Vivian |
| What have Aaron's prior health insurance analyses concluded? | Brandon to review |
| Can Gusto offer ICHRA through its existing payroll infrastructure? | Namrata Jain + Aaron |
| What is the regulatory classification of CrowdHealth state-by-state? | Aaron + Legal (Allison Hess) |
| Is there an established MEWA operator suited for freelancers/solos Gusto could embed? | Brandon + Aaron |
| What would it take to deepen Stride to embedded enrollment (not referral)? | Stephanie Liu + Brandon |
| What is Stride's current contract term and revenue share? | Brandon to review |

---

## 7. Decision Log

| ID | Decision | Date | Owner |
|---|---|---|---|
| — | Current approach: Stride referral (minimal integration) | Pre-2026 | Prior team |
| — | Curative exploration initiated (Lettuce comparable) | 2026-05 | Stephanie Liu |

---

*Next update: After Curative initial findings from Stephanie + Vivian. Brandon + Stephanie to consolidate strategic one-pager.*
