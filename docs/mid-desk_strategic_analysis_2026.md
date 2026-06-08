# Mid-Desk State Tax Registration: Strategic Analysis & Decision Framework

**Prepared for:** Brandon Reich, Corporate Development - Product Partnerships  
**Date:** June 5, 2026  
**Status:** CONFIDENTIAL - Internal Strategy Document  
**Distribution:** Ashby Taylor, Alex Kehayias, Jessica Sacks, Chris Elkins, Daniella, Luke, Bridgette

---

## Executive Summary

Gusto faces a critical decision point on its Mid-Desk State Tax Registration (STR) partnership. With contract expiry in November 2026 and a 120-day notice period triggering in late July, we must decide between three strategic paths: (1) accelerate first-party build and exit Mid-Desk, (2) pursue multi-provider strategy with phased transition, or (3) renew Mid-Desk while delaying first-party investment.

**Key Decision Gates:**
- **Late July 2026:** Notice window opens (120 days before November expiry)
- **December 1, 2026:** Target first-party STR launch (per DEC-004)
- **November 2026:** Current Mid-Desk contract expires

**Bottom Line:** We have ~6 weeks to finalize our position before the notice period triggers. This memo provides the analysis framework to drive that decision.

---

## 1. Current State Assessment

### Financial Impact

**Current Economics:**
- Pricing: $35/registration
- Gusto margin: ~82%
- Monthly minimum: 2,500 registrations
- Annual contract value: ~$1.05M minimum (2,500 × 12 × $35)
- 2026 Addendum: Local/PFML at $200 end-user / $165 Gusto fee

**Risk Exposure:**
- Mid-Desk signaling 2x+ pricing increase at renewal
- At 2x pricing ($70/registration): $2.1M annual spend, margin compression to ~60-65%
- At current volumes, a 2x increase = $1M+ annual cost increase

### Dependency Risk Profile

**Critical Dependencies:**
- STR is core to GBC product-market fit
- Mid-Desk currently handles 100% of STR volume
- No fallback provider currently contracted
- CorpNet deprecated (DEC-003: too much eng overhead, inferior performance)

**Operational Risks:**
- SLA termination rights after 2 consecutive months of failure
- State-specific POA (Power of Attorney) compliance issues flagged (e.g., Hawaii)
- Andrew Adams back-channeling Gusto's first-party plans to Mid-Desk contacts
- Mid-Desk aware of Mosey acquisition and GBC first-party intent

**Leverage Points:**
- Most-favored customer clause in current contract
- 120-day notice period = negotiation timeline
- Demonstrated first-party capability (Browser Base POC)
- Get Palm optionality as alternative provider
- SLA performance issues documented

---

## 2. Strategic Options Analysis

### Option 1: Full First-Party Build (Browser Base)

**Description:** Accelerate Browser Base POC to production, exit Mid-Desk at contract expiry (Nov 2026), own 100% of STR by Dec 1, 2026.

**Timeline:**
- May 2026: Browser Base POC underway (go/no-go decision completed week of May 19)
- June-August 2026: Pilot phase with select customers
- September-October 2026: Scale to production readiness
- November 2026: Mid-Desk contract expires
- December 1, 2026: First-party STR fully operational (DEC-004 target)

**Investment Required:**
- Engineering: Full-time team through Q4 2026 (Namrata Jain's eng org)
- Product: Alex Kehayias + Jessica Sacks ownership
- Browser Base vendor costs: TBD (classification: vendor per Ashby direction)
- Risk: If Browser Base POC fails, no fallback provider in place

**Margin Impact:**
- Short-term: Increased costs during build phase
- Long-term: Eliminate $35/registration third-party cost, capture 100% margin
- At 2,500 registrations/month: $1.05M annual savings vs. current pricing, $2.1M vs. 2x pricing

**Risk Profile:**
- HIGH execution risk: December 1 deadline is aggressive
- Andrew Adams socialization risk: Mid-Desk already aware of first-party plans
- Customer experience risk: First-party quality must meet/exceed Mid-Desk SLAs
- State complexity risk: 50+ state variations, POA compliance requirements
- Browser Base vendor dependency: New vendor risk vs. known Mid-Desk quantity

**Strategic Benefits:**
- Full margin capture
- Product differentiation (scribing/concierge model)
- No vendor pricing leverage exposure
- Foundation for future GBC expansion (Local/PFML, etc.)

### Option 2: Multi-Provider Strategy (Mid-Desk + Get Palm + First-Party)

**Description:** Renew Mid-Desk at renegotiated terms, onboard Get Palm as second provider, build first-party in parallel with extended timeline (Q1-Q2 2027).

**Timeline:**
- July 2026: Trigger 120-day notice, open renegotiation with Mid-Desk
- August-September 2026: Get Palm technical evaluation + pilot
- October 2026: Finalize Mid-Desk renewal (reduced terms, multi-year lock?)
- November 2026: Get Palm production-ready as secondary provider
- Q1-Q2 2027: First-party build with lower time pressure
- Q2 2027: Phase out third-party providers

**Investment Required:**
- Engineering: Split focus across Get Palm integration + first-party build
- Vendor costs: Mid-Desk renewal + Get Palm contracts + Browser Base
- Complexity: Three parallel systems (Mid-Desk, Get Palm, first-party)

**Provider Allocation Strategy:**
- Mid-Desk: Primary, high-volume states (70% of volume)
- Get Palm: Secondary, lower-complexity states (30% of volume)
- First-party: Pilot states → gradual rollout

**Margin Impact:**
- Short-term: Higher vendor costs (two providers), offset by negotiated Mid-Desk reduction
- Medium-term: Gradual margin improvement as first-party scales
- Negotiation leverage: "We have Get Palm ready to go" pressures Mid-Desk on pricing

**Risk Profile:**
- MEDIUM execution risk: More breathing room on first-party timeline
- Operational complexity: Three systems to maintain, routing logic required
- Get Palm immaturity: STR still in development pipeline (not live yet)
- Mid-Desk negotiation risk: May refuse multi-provider arrangement

**Strategic Benefits:**
- De-risked transition: fallback options at every stage
- Negotiation leverage: credible alternatives pressure Mid-Desk pricing
- Extended timeline: higher-quality first-party build
- Get Palm upside: If STR + entity formation work well, potential long-term partnership

### Option 3: Renew Mid-Desk + Delay First-Party

**Description:** Negotiate best possible Mid-Desk renewal (multi-year, capped pricing increases), defer first-party build to 2027+.

**Timeline:**
- July-August 2026: Mid-Desk renewal negotiation
- September 2026: Lock in 2-3 year Mid-Desk contract
- 2027+: Revisit first-party build when resources/priorities allow

**Investment Required:**
- Minimal: Negotiation time only, no build investment
- Vendor costs: Accept Mid-Desk pricing increase (negotiate cap)

**Margin Impact:**
- Accept margin compression (likely 2x pricing = $2.1M annually)
- No path to margin improvement without renegotiation or first-party build

**Risk Profile:**
- HIGH strategic risk: Lock in vendor dependency for 2-3 years
- Pricing exposure: Mid-Desk has full leverage, limited Gusto negotiating power
- Competitive risk: First-party capability is differentiator (scribing model, etc.)
- Andrew Adams leak: Mid-Desk knows we're considering first-party, weakens negotiating position

**Strategic Drawbacks:**
- Surrenders first-party optionality for multi-year period
- No margin improvement path
- GBC product roadmap constrained by Mid-Desk capabilities

---

## 3. Technology Evaluation

### Browser Base POC Status

**Current State (as of May 23, 2026):**
- POC underway, go/no-go decision completed week of May 19
- Leaning GO (per DEC-005)
- Classification: Vendor (per Ashby direction)
- Product lead: Alex Kehayias (built Stripe Atlas, understands this space)
- Engineering: Namrata Jain's org

**Open Questions:**
- What is the technical architecture? (Scraping? API? Hybrid?)
- What is the Browser Base cost structure?
- What state coverage has been validated in POC?
- What is the SLA/reliability profile vs. Mid-Desk?
- What is the timeline to production readiness?

**Critical Success Factors:**
- POA compliance across all 50 states
- SLA performance matching/exceeding Mid-Desk
- Cost structure that delivers margin improvement
- Integration with GBC scribing/concierge model

### Get Palm Capabilities

**Company Profile (as of May 23, 2026):**
- Size: ~20-50 employees
- Focus: "Doing a lot at once, not super focused" (Brandon's assessment)
- Contact: Connor (oversharer, useful for intel), Helen (sent API docs post-meeting)

**Product Suite (all à la carte, API-first):**
1. **Onboard:** Business search + verification (LIVE)
2. **Verify:** KYB/KYC with risk levels + compliance checks (LIVE)
3. **Monitor:** Subscription-based change tracking (LIVE)
4. **Comply:** Action on monitoring alerts - annual reports, DBAs, S-corp filings (LIVE)
5. **Entity formation:** All 50 states, LLCs/corps/professional entities (LAUNCHING in next couple weeks)
6. **STR (State Tax Registration):** IN DEVELOPMENT PIPELINE (not live yet)
7. **Registered agent:** Through state partners; considering in-house

**Strategic Fit Analysis:**
- **STR:** Core need, but NOT LIVE YET - timeline risk
- **Entity formation:** Highly relevant to SYB first-party spike (Izzy: "hasn't seen anyone doing e2e with minimal humans")
- **Monitor/Verify:** Potential fit with Gusto risk team
- **Comply:** Relevant to GBC annual reports / foreign qualifications

**Evaluation Criteria (Brandon's framework):**
- Compare to Mosey's current methods: cheaper/better/faster (need 2 of 3)
- 6-12 month rental potential while Gusto builds first-party
- Understand what's a huge lift vs. what could be rented short-term

**Open Questions:**
- When will Get Palm STR be production-ready?
- What is pricing structure for STR?
- What is state coverage vs. Mid-Desk?
- What is API quality/reliability?
- What is SLA commitment?

**Next Steps (per COM-001, COM-010):**
- Brandon to pass Get Palm docs + notes to Alex to kick the tires
- Brandon to email Connor for lunch/dinner - extract how they built entity formation
- Gusto risk team to evaluate Monitor/Verify APIs

### Mosey Integration

**Context:**
- Mid-Desk aware of Mosey acquisition (per partners.md)
- Andrew Adams has shared this context with Mid-Desk contacts
- Mosey capabilities relevant to first-party build

**Open Questions:**
- What Mosey technology/IP can accelerate first-party STR build?
- What is Mosey's state coverage/compliance database?
- Can Mosey team augment Browser Base POC?

---

## 4. Negotiation Leverage Analysis

### What Cards Does Gusto Hold?

**1. First-Party Capability (Browser Base POC)**
- Status: POC in progress, leaning GO
- Signal: "We can do this ourselves" is credible
- Limitation: Andrew Adams has already leaked this to Mid-Desk (weakens surprise value)

**2. Get Palm Optionality**
- Status: Exploratory meeting completed May 23, APIs under review
- Signal: "We have a credible alternative provider"
- Limitation: Get Palm STR not live yet (timeline risk)

**3. Most-Favored Customer Clause**
- Status: In current contract
- Leverage: If Mid-Desk offers better pricing to other customers, Gusto can demand parity
- Action: Investigate Mid-Desk pricing with other customers (competitive intel)

**4. SLA Performance Issues**
- Status: Documented issues (e.g., Hawaii POA compliance)
- Leverage: "We have grounds to terminate for cause if SLA failures continue"
- Limitation: Need 2 consecutive months of failure (per contract)

**5. Volume Commitment**
- Status: 2,500 registrations/month minimum in current contract
- Leverage: GBC is scaling - future volume growth is valuable to Mid-Desk
- Negotiation angle: "Lock in our growth with better pricing"

**6. Multi-Year Lock (if we want it)**
- Status: Current contract is annual
- Leverage: "We'll commit to 2-3 years if you cap pricing increases"
- Risk: Locks in vendor dependency

### What Cards Does Mid-Desk Hold?

**1. Operational Criticality**
- Reality: GBC depends 100% on Mid-Desk today
- Limitation: We can't flip a switch to first-party or Get Palm immediately

**2. State Expertise**
- Reality: Mid-Desk has deep state-by-state compliance knowledge
- Limitation: Browser Base + Get Palm can replicate this

**3. Incumbent Advantage**
- Reality: Switching costs are high (eng effort, customer experience risk)
- Limitation: Browser Base POC proves switching is feasible

**4. Awareness of Gusto's Strategy**
- Reality: Andrew Adams has shared first-party plans + Mosey acquisition
- Impact: Mid-Desk knows we're considering alternatives, but also knows we're not ready to switch immediately

### Negotiation Strategy Recommendations

**Approach: "Friendly but Firm"**

1. **Open with transparency:** "We're exploring first-party and alternative providers. We'd prefer to continue the partnership, but need competitive economics."

2. **Anchor on Most-Favored Customer clause:** "We believe other customers are getting better pricing. Show us your best offer."

3. **Introduce Get Palm as credible alternative:** "We've completed technical diligence on Get Palm. Their STR product launches Q3 2026. We're prepared to split volume."

4. **Highlight mutual value:** "GBC is scaling rapidly. Lock in our long-term business with fair pricing, or we'll build first-party."

5. **Set clear decision timeline:** "We need your best offer by August 1. If we can't reach terms, we'll trigger the 120-day notice and transition to first-party + Get Palm."

**Goal:** Achieve one of the following outcomes:
- **Outcome A:** 2-year renewal at <1.5x current pricing ($50-52/registration), with annual volume ratchets
- **Outcome B:** 1-year renewal at current pricing ($35/registration), giving us time to build first-party with lower pressure
- **Outcome C:** No renewal, commit to first-party + Get Palm transition by November 2026

**Fallback:** If Mid-Desk insists on 2x pricing with no flexibility, walk away and commit to Option 1 (full first-party build).

---

## 5. Risk Analysis

### Risk 1: Andrew Adams Back-Channeling

**Nature of Risk:**
- Andrew Adams (former Mid-Desk employee, now on Gusto GBC/Tax team)
- Has shared Gusto's first-party plans and Mosey acquisition with Mid-Desk contacts
- Alex Kehayias + Jessica Sacks aware of issue
- Assessment: Not malicious, just overly social with former coworkers

**Mitigation:**
- Limit Andrew's access to Mid-Desk negotiation strategy discussions
- Have direct conversation with Andrew (Jessica or Alex to lead): "We value your input, but need to keep negotiation strategy confidential"
- Do NOT exclude Andrew from product discussions (protect him from political fallout)
- Accept that Mid-Desk already knows we're exploring alternatives - use this as negotiation leverage, not try to hide it

**Action Owner:** Jessica Sacks (product owner of Mid-Desk relationship)

### Risk 2: 2x Pricing Impact

**Financial Impact:**
- Current: $35/registration, $1.05M annually (at 2,500/month minimum)
- 2x pricing: $70/registration, $2.1M annually
- Incremental cost: $1.05M annually

**Margin Impact:**
- Current margin: ~82%
- 2x pricing margin: ~60-65% (assuming no pass-through to customers)

**Strategic Implications:**
- GBC unit economics deteriorate significantly
- Harder to justify GBC investment to leadership
- Competitive pressure to pass costs to customers (pricing increase)

**Mitigation:**
- Use negotiation leverage to cap increase at <1.5x
- Build first-party capability to eliminate third-party cost entirely
- Consider selective pass-through to customers for premium STR features

### Risk 3: First-Party Build Delays

**Sources of Delay:**
- Browser Base POC fails or underperforms
- State-by-state compliance complexity (50+ variations)
- POA requirements vary by state
- Engineering resource constraints (Namrata's org capacity)
- Quality/reliability doesn't meet Mid-Desk SLA standards

**Impact:**
- Miss December 1, 2026 target (DEC-004)
- Forced to extend Mid-Desk contract at unfavorable terms
- Customer experience degrades if rushed to production

**Mitigation:**
- Start Get Palm technical evaluation NOW (June 2026) as fallback
- Build contingency timeline: if Browser Base isn't ready by September, pivot to Get Palm for November launch
- Phased rollout: start with low-complexity states, expand gradually
- Over-invest in Q3 engineering resources (pull forward capacity)

**Action Owner:** Alex Kehayias (product), Namrata Jain (engineering)

### Risk 4: Customer Experience During Transition

**Failure Modes:**
- First-party STR takes longer than Mid-Desk (customers complain)
- First-party STR fails in certain states (compliance issues)
- Transition creates confusion for customers (which provider is handling my registration?)

**Impact:**
- GBC NPS declines
- Customer churn increases
- Sales pipeline slows (word-of-mouth damage)

**Mitigation:**
- Pilot first-party with friendly customers (get feedback early)
- Maintain Mid-Desk as fallback during transition (hybrid approach)
- Over-communicate with customers: "We're improving our STR service, here's what to expect"
- SLA matching: Don't launch first-party until it meets/exceeds Mid-Desk performance

**Action Owner:** Jessica Sacks (product), Chris Elkins (partner management)

### Risk 5: Get Palm Execution Risk

**Sources of Risk:**
- STR product not live yet (in development pipeline)
- Company is "doing a lot at once, not super focused" (Brandon's assessment)
- Small company (~20-50 employees) - capacity constraints
- API quality/reliability unproven at scale

**Impact:**
- Get Palm can't serve as credible Mid-Desk alternative
- Multi-provider strategy (Option 2) collapses to forced Mid-Desk renewal (Option 3)

**Mitigation:**
- Complete technical evaluation in June 2026 (COM-001: Brandon to pass docs to Alex)
- Pilot Get Palm in parallel with Browser Base (if possible)
- Extract competitive intel from Connor at Get Palm (COM-010: lunch/dinner)
- Maintain low expectations: treat Get Palm as optionality, not core strategy

**Action Owner:** Alex Kehayias (technical evaluation), Brandon Reich (relationship management)

---

## 6. Timeline & Decision Gates

### June 2026: Intelligence Gathering

**Key Activities:**
- Complete Browser Base POC go/no-go (DONE week of May 19)
- Alex Kehayias evaluates Get Palm API docs (COM-001)
- Brandon extracts entity formation build intel from Connor at Get Palm (COM-010)
- Finance (Jason Chao) models financial impact of each option
- Confirm Mid-Desk pricing with other customers (Most-Favored Customer due diligence)

**Decision Gate:** By June 30, determine if we have two credible alternatives to Mid-Desk (Browser Base + Get Palm)

**Owners:** Alex Kehayias (Browser Base), Brandon Reich (Get Palm), Jason Chao (financial model)

### July 2026: Strategy Alignment

**Key Activities:**
- Internal stakeholder alignment: Andrew Adams, Jessica Sacks, Luke, Alex Kehayias, Daniella, Ashby Taylor, Bridgette
- Finalize negotiation strategy and walk-away position
- Prepare for two parallel paths:
  - Path A: Mid-Desk renewal negotiation
  - Path B: First-party transition plan

**Decision Gate:** By July 15, finalize which option (1, 2, or 3) we're pursuing

**Owners:** Brandon Reich (strategy synthesis), Ashby Taylor (executive alignment)

### Late July 2026: Notice Window Opens

**Key Activities:**
- Trigger 120-day notice if we're not renewing (Option 1) or if we want negotiation leverage (Option 2)
- Open Mid-Desk renewal discussions (if pursuing Option 2 or 3)
- Communicate decision to internal stakeholders

**Critical Date:** ~July 23, 2026 (120 days before November 2026 expiry)

**Owner:** Brandon Reich (notice trigger), Chris Elkins (Mid-Desk relationship)

### August-September 2026: Execution

**Path A (Option 1 - First-Party):**
- Accelerate Browser Base pilot
- Confirm December 1 launch feasibility
- Prepare customer communications

**Path B (Option 2 - Multi-Provider):**
- Mid-Desk renewal negotiation
- Get Palm integration planning
- First-party extended timeline (Q1-Q2 2027)

**Path C (Option 3 - Renew Mid-Desk):**
- Finalize Mid-Desk contract terms
- Defer first-party build

**Decision Gate:** By September 30, confirm we're on track for chosen path

**Owners:** Alex Kehayias (product execution), Namrata Jain (engineering execution), Brandon Reich (vendor negotiations)

### October 2026: Final Preparations

**Key Activities:**
- Finalize Mid-Desk contract (if renewing)
- Pilot first-party STR (if launching December 1)
- Get Palm production readiness (if multi-provider)

### November 2026: Contract Expiry

**Key Activities:**
- Current Mid-Desk contract expires
- New contract takes effect (if renewed)
- First-party launch imminent (if Option 1)

### December 1, 2026: First-Party Launch (Target per DEC-004)

**Key Activities:**
- First-party STR goes live (if Option 1 or Option 2)
- Customer communications
- Monitor SLAs and customer experience

---

## 7. Recommendation Framework

### Information Needed to Make the Call

**By June 30, 2026, we need answers to:**

1. **Browser Base feasibility:** Can we launch first-party STR by December 1, 2026 at Mid-Desk quality levels?
   - **Owner:** Alex Kehayias
   - **Evidence:** POC results, engineering timeline, state coverage assessment

2. **Get Palm viability:** Is Get Palm a credible alternative provider for STR?
   - **Owner:** Brandon Reich + Alex Kehayias
   - **Evidence:** API evaluation, STR launch timeline, pricing structure, SLA commitments

3. **Financial impact:** What is the true cost of each option?
   - **Owner:** Jason Chao
   - **Evidence:** Build costs, vendor costs, margin analysis, 3-year P&L impact

4. **Mid-Desk competitive pricing:** Are we getting Most-Favored Customer pricing?
   - **Owner:** Brandon Reich + Chris Elkins
   - **Evidence:** Competitive intel from other Mid-Desk customers, industry benchmarks

5. **Engineering capacity:** Can Namrata's org deliver first-party by December 1?
   - **Owner:** Namrata Jain
   - **Evidence:** Sprint planning, resource allocation, dependency mapping

6. **Risk appetite:** What is leadership's tolerance for customer experience risk during transition?
   - **Owner:** Ashby Taylor + Bridgette Haymaker
   - **Evidence:** Executive alignment conversations

### Decision Matrix

| Option | Best If... | Avoid If... |
|--------|-----------|-------------|
| **Option 1: Full First-Party** | Browser Base POC is strong, eng capacity confirmed, leadership comfortable with execution risk, Mid-Desk demands 2x+ pricing | Browser Base POC weak, eng capacity constrained, customer experience risk too high |
| **Option 2: Multi-Provider** | Get Palm STR is viable, we want de-risked transition, Mid-Desk willing to negotiate, we can afford dual-vendor costs | Get Palm STR delayed, Mid-Desk refuses multi-provider, eng can't support three parallel systems |
| **Option 3: Renew Mid-Desk** | First-party not feasible by Q2 2027, other priorities take precedence, Mid-Desk offers favorable terms | Mid-Desk demands 2x pricing, we want to preserve first-party optionality, margin compression unacceptable |

### Recommended Path (Preliminary)

**Based on available information as of June 5, 2026, I recommend Option 2: Multi-Provider Strategy.**

**Rationale:**
1. **De-risks transition:** We maintain Mid-Desk continuity while building first-party capability with an extended timeline
2. **Negotiation leverage:** Get Palm as credible alternative pressures Mid-Desk on pricing
3. **Customer experience protection:** Hybrid approach minimizes risk of first-party launch issues
4. **Strategic optionality:** We can accelerate or decelerate first-party build based on resource availability and quality benchmarks
5. **Margin improvement path:** Even if Mid-Desk renews at higher pricing, we have clear path to first-party margin capture in 2027

**Key Conditions:**
- Get Palm STR must be production-ready by Q3 2026 (confirm in June evaluation)
- Mid-Desk renewal pricing must be <1.5x current rates ($50-52/registration)
- Browser Base POC must show viable path to first-party (even if December 1 is too aggressive)
- Engineering capacity must support Get Palm integration + first-party build in parallel

**If these conditions are NOT met, pivot to Option 1 (full first-party) or Option 3 (renew Mid-Desk) based on which conditions fail.**

---

## 8. Stakeholder Alignment Plan

### Internal Alignment Required

**Executive Level (Ashby + Bridgette):**
- Strategic direction: Are we committed to first-party STR as a long-term capability?
- Risk appetite: How much customer experience risk is acceptable during transition?
- Investment approval: What is the budget for first-party build + dual vendors?

**Product Level (Alex + Jessica + Izzy + Farron):**
- Browser Base POC results and roadmap
- Get Palm evaluation findings
- First-party feature parity with Mid-Desk
- GBC product roadmap impact

**Engineering Level (Namrata + Kevin Werner):**
- Engineering capacity and timeline feasibility
- Technical architecture and complexity assessment
- Quality/reliability benchmarks

**Partner Management (Chris Elkins):**
- Mid-Desk relationship temperature
- Negotiation strategy and walk-away position
- Customer communication plan

**Finance (Jason Chao):**
- Financial impact modeling
- Margin analysis
- Budget allocation

**Legal (Allison Hess):**
- Contract termination mechanics
- Most-Favored Customer clause interpretation
- New vendor contract terms (Get Palm, Browser Base)

**Cross-Functional (Andrew Adams, Luke, Daniella):**
- Andrew: First-party technical perspective (while managing back-channeling risk)
- Luke: [Role unclear - need clarification]
- Daniella: [Role unclear - need clarification]

### Alignment Process

**Week of June 3-7:**
- Brandon synthesizes this analysis
- 1:1s with Alex, Jessica, Chris to gather input
- Finance model request to Jason Chao

**Week of June 10-14:**
- Stakeholder review: Alex, Jessica, Chris, Namrata
- Identify gaps in analysis
- Refine recommendation

**Week of June 17-21:**
- Executive alignment: Ashby, Bridgette
- Final decision on strategic direction
- Prepare for July notice trigger

**Week of June 24-28:**
- Broader team alignment: Andrew, Luke, Daniella, Kevin
- Communication plan finalized
- Mid-Desk negotiation strategy locked

---

## 9. Open Questions & Next Actions

### Critical Open Questions

1. **Browser Base POC:** What are the detailed results? State coverage? Cost structure? SLA benchmarks?
2. **Get Palm STR timeline:** When exactly will their STR product be production-ready?
3. **Mid-Desk competitive pricing:** What are other customers paying?
4. **Engineering capacity:** Does Namrata's org have bandwidth for December 1 launch?
5. **Luke and Daniella roles:** What are their specific stakes in this decision?
6. **Mosey integration:** Can Mosey tech/IP accelerate first-party build?
7. **Browser Base cost structure:** What is the all-in cost per registration?
8. **Get Palm pricing:** What is their proposed cost per registration?

### Immediate Next Actions (Week of June 3-7)

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| Complete Browser Base POC detailed analysis | Alex Kehayias | June 7 | In Progress |
| Evaluate Get Palm API docs and capabilities | Alex Kehayias | June 14 | Open (COM-001) |
| Lunch/dinner with Connor (Get Palm) for entity formation intel | Brandon Reich | June 14 | Open (COM-010) |
| Build financial model for all three options | Jason Chao | June 14 | Not Started |
| Investigate Mid-Desk competitive pricing (Most-Favored Customer due diligence) | Brandon Reich + Chris Elkins | June 21 | Not Started |
| Confirm Namrata's org engineering capacity and timeline | Namrata Jain | June 14 | Not Started |
| Clarify Luke and Daniella roles in decision | Brandon Reich | June 7 | Not Started |

### Secondary Actions (Week of June 10-21)

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| Draft Mid-Desk negotiation strategy memo | Brandon Reich | June 21 | Not Started |
| Align Ashby on strategic direction and risk appetite | Brandon Reich | June 21 | Not Started |
| Align Bridgette on GBC investment and customer experience risk | Brandon Reich | June 21 | Not Started |
| Assess Mosey integration opportunities | Alex Kehayias | June 21 | Not Started |
| Draft customer communication plan for first-party transition | Jessica Sacks | June 28 | Not Started |

---

## 10. Appendices

### Appendix A: Key Contract Terms (Mid-Desk)

- **Pricing:** $35/registration
- **Margin to Gusto:** ~82%
- **Contract Expiry:** November 2026
- **Notice Period:** 120 days (trigger by late July 2026)
- **Monthly Minimum:** 2,500 registrations
- **Most-Favored Customer Clause:** Yes
- **SLA Termination Rights:** After 2 consecutive months of failure
- **2026 Addendum:** Local/PFML at $200 end-user / $165 Gusto fee

### Appendix B: Decision Log

Referenced decisions from /memory/decisions.md:

- **DEC-001:** Brandon's operating model (Corp Dev = strategy/contracts; Chris = day-to-day)
- **DEC-002:** Brandon + Chris work "tied at the hip" on partnerships
- **DEC-003:** No CorpNet revival (too much eng overhead, inferior performance)
- **DEC-004:** Multi-provider strategy; first-party STR by ~Dec 1, 2026; Get Palm exploration
- **DEC-005:** Browser Base POC underway; go/no-go decision week of May 19; leaning go
- **DEC-007:** Mid-desk renewal prep starts Aug-Sep 2026; 90-day notice = late July trigger

### Appendix C: Partner Landscape

**Active Providers:**
- **Mid-Desk:** Current STR provider (100% volume)
- **Browser Base:** POC for first-party STR + entity formation
- **Get Palm:** Exploratory; STR in development, entity formation launching soon

**Inactive/Deprecated:**
- **CorpNet:** No longer tracking (DEC-003)

### Appendix D: Stakeholder Map

| Stakeholder | Role | Stake in Decision |
|-------------|------|-------------------|
| Brandon Reich | Corp Dev - Product Partnerships | Decision owner, negotiation strategy |
| Ashby Taylor | Manager, Corp Dev | Executive alignment, resource allocation |
| Alex Kehayias | PM GBC | Product strategy, Browser Base POC, Get Palm evaluation |
| Jessica Sacks | PM Tax Experiences | Mid-Desk relationship owner (product side), customer experience |
| Chris Elkins | Partner Manager | Mid-Desk relationship owner (day-to-day), negotiation execution |
| Namrata Jain | PE Entity + Solo | Engineering feasibility, capacity, timeline |
| Kevin Werner | PE Product Partnerships | Engineering strategy, technical architecture |
| Andrew Adams | GBC/Tax Team (former Mid-Desk) | First-party technical input, back-channeling risk |
| Jason Chao | Finance | Financial modeling, margin analysis |
| Allison Hess | Commercial Counsel | Contract terms, legal strategy |
| Luke | [Role TBD] | [Stake TBD] |
| Daniella | [Role TBD] | [Stake TBD] |
| Bridgette Haymaker | VP Empowering Pro/Co | Executive alignment, GBC strategic direction |

---

**END OF MEMO**

**Next Update:** June 21, 2026 (after intelligence gathering phase complete)

**Distribution:** This memo is CONFIDENTIAL. Do not share with Mid-Desk, Get Palm, or external parties. Internal stakeholders only.

**Questions/Feedback:** Contact Brandon Reich (brandon.reich@gusto.com | Slack: UCBUECCKF)
