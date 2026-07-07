# Design: Gusto × Anthropic — "Start Your Business" Pitch Deck

**Date:** 2026-07-07
**Owner:** Brandon Reich (build/architecture); presented by Izzy Rogner-Hall + Abhas Bodas
**Status:** Approved for implementation

## Context

This is the third of three parallel Anthropic pitch tracks to Lina (Anthropic GTM DRI), alongside the SMB-direct pitch (Sam Haber/Matan Gal) and the accountant pitch ("Claude for Accountants," Brandon/Brittany/Bridgette — already live at `gusto-anthropic-accountants`). This deck covers **Start Your Business (SYB)**: Gusto's entity formation product (LLC/corp formation).

Note: SYB's internally-tracked GA target (H1 2027, per `20-Products/Start Your Business (SYB).md`) is considered stale for the purposes of this pitch — this partnership is important enough that Gusto will accelerate dev and make large moves as needed. The deck should not reference that date at all, and should write about the SYB capability in the present tense, as something that exists/is being actively built now, not as a distant future roadmap item.

Brandon's role mirrors his role on the accountant deck: architect and build the HTML deck; Izzy and Abhas present it to Lina. Brandon will likely sit in but probably won't present.

Source material: Izzy Rogner-Hall's "SYB Story Arc" notes (Notion, `[INTERNAL] Anthropic Pitch Sync` page), plus Obsidian partner/product notes for SYB and ZenBusiness.

## Sensitivity note (do not lose this)

Gusto's current entity-formation partner is **ZenBusiness**. Their contract (per `10-Partners/ZenBusiness.md`) has SKU-scoped exclusivity (Section 3.1) that could conflict with a first-party SYB build; clean-room development is the legal defense path for any first-party build. **The deck must not name ZenBusiness or any specific formation vendor.** Entity formation is framed purely as a Gusto-powered capability. This mirrors how the accountant deck avoided exposing confidential codenames (e.g., "Diomedes").

## Visual system

Reuse the exact HTML/CSS/JS shell from the `gusto-anthropic-accountants` deck (source: `tmp_deck_updated.html` in this repo) as the base:
- Fonts: DM Sans (body), DM Serif Display (headlines)
- Palette: Gusto coral (`#F45D3B`) accent on dark stage (`#1A1A1A`) background, warm off-white slide surfaces
- Mechanics: `.slide`/`.slide.active` show/hide, dot-nav, prev/next nav buttons, keyboard arrow navigation, slide counter, slide numbers
- No new visual identity — content-only reskin, per approved decision to prioritize speed and cross-deck brand consistency

## Slide structure

Order follows Izzy's own story-arc narrative (not the accountant deck's Market→Partnership→Data→Product→GTM→Research→Ask order), since Izzy is presenting and this preserves his intended flow.

1. **Cover** — "Gusto × Anthropic — Start Your Business"
2. **The Market** — new business formation is surging; AI is accelerating it.
   - ~5.7M new business applications/year in the US (U.S. Census Bureau, Business Formation Statistics, 2025 — 478,800/month average), up 400%+ from the 2004 baseline (~89,500/month)
   - From Gusto's own **2026 New Business Formation Report**: 60% of new founders used AI to help launch (2x since 2023); Gen Z now leads new business starts (9% vs. 5% for Boomers) and is 5x more likely to say AI was essential to starting
   - Framing note: this is Gusto's own economist research, reinforcing the same "Gusto has proprietary data authority" move used in the accountant deck's data-moat slide
3. **The Customer Problem** — people come to Claude passionate about an idea, not a business. Before they can run a business they must *start* one: entity formation, registered agent, state (Secretary of State) registration — "systems of action" that require real-world registration, which Claude can't complete today.
   - Include GEP walkthrough soundbite: Claude currently gets a user ~10% of the journey; it stalls exactly where action is required.
4. **Why Anthropic Should Care (thesis)** — if Claude can carry someone through business formation, that becomes the reason they adopt Claude as their ongoing "operating system" for their whole SMB stack. Framed as a top-of-funnel land grab against Lovable/ChatGPT for the next generation of SMB owners, before they pick their SMB tools elsewhere.
5. **The Solution** — Gusto fills the missing category (entity formation) in the SMB stack, powered by Gusto (no partner named). Includes:
   - A placeholder demo block (styled like a GIF/video frame), labeled `[Demo — Izzy/Abhas to provide]`
   - A nod to the existing `Claude for Small Business` press release (anthropic.com/news/claude-for-small-business) as the GTM pattern this extends
6. **What Gusto Will Build — Option 1** — SYB skill inside the Claude SMB Plugin (pulls a Gusto-provided skill)
7. **What Gusto Will Build — Option 2** — Gusto MCP Connector exposing all SYB skills
8. **What Gusto Will Build — Option 3** — Native Claude functionality, Gusto-powered under the hood

   Slides 6–8 are a working set for **internal Gusto deliberation** (Izzy/Abhas/Farron/Brandon, not Anthropic) — the decision on which option(s) to lead with happens inside Gusto before this deck goes in front of Lina. This is not an open menu to be debated live with Anthropic; by the time the deck is pitch-ready, it should present a single chosen direction (or a clear primary + fallback), with the losing option slides struck from the final deck. Build all three now so the internal decision has something concrete to react to.
9. **The Ask** — GTM only, no technical ask: announcement, website inclusion, enablement sessions (roadshows, webinars). Gusto builds the product; no capital or engineering ask of Anthropic.
10. **What Anthropic Gets** — doesn't have to build the action layer, doesn't take on the eng work, doesn't own the compliance/registration liability for entity formation.
11. **Close** — mirrors the accountant deck's closing slide treatment.

## Data & placeholders

Real data (sourced above) is used for market-sizing and AI-adoption stats. Two things remain explicit placeholders, styled consistently and clearly flagged as TBD (matching how the accountant deck handled its TBD roadmap dates):
- Demo GIF/screenshots — none exist yet
- Frequency/volume of Claude users who specifically ask about starting a business — no internal number found in source notes; distinct from the market-sizing stats, which are real

GA timing (H1 2027 internally, per `20-Products/Start Your Business (SYB).md`) will **not** be stated as a specific date in the external-facing deck, consistent with how the accountant deck avoided committing to hard dates externally.

## Publish & asset-tracking plan

- New page on share-some-html: slug `gusto-anthropic-entity-formation`, title "Gusto × Anthropic — Start Your Business"
- After creation, cache the returned owner key in a new memory reference file (same pattern as the existing `reference_share_html_anthropic.md`), so future sessions can push updates without re-creating the page
- Add a "Pitch Deck Assets" section to the Obsidian `20-Products/Start Your Business (SYB).md` note with the deck URL/slug (the owner key itself stays out of Obsidian — private-memory-only, consistent with current handling of the accountant deck's key)

## Out of scope

- Talk track / speaker notes doc (accountant deck has a separate Google Doc for this — not requested here yet)
- Resolving which of the three "what Gusto will build" options is the lead — explicitly left open per Izzy's collaborative-decision approach
- Any mention of ZenBusiness, contract terms, or exclusivity — excluded entirely from this external-facing artifact
