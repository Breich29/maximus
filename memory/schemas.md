# Memory Schemas

_Canonical field definitions for all memory stores._

_Last updated: 2026-05-21_

---

## people.md

| Field | Description |
|---|---|
| Name | Full name |
| Email | Work email |
| Slack ID | Uxxxxxxxxx format |
| DM Channel | Dxxxxxxxxx format (for message routing) |
| Title | Current job title |
| Team | Team/org within Gusto |
| Relationship | manager / direct-report / peer / cross-functional / external |
| Tier | 1 (weekly), 2 (monthly), 3 (long tail) |
| Context | Key working context, current projects, watch items |

---

## decisions.md

| Field | Description |
|---|---|
| ID | DEC-XXX |
| Summary | One-line description of what was decided |
| Date | YYYY-MM-DD |
| Decided by | Person(s) who made the call |
| Source | Meeting, DM, doc reference |
| Status | Open / Archived |

---

## commitments.md

| Field | Description |
|---|---|
| ID | COM-XXX |
| Owner | Who owes the action |
| Recipient | Who it's owed to |
| What | Description of the commitment |
| Due | Due date or timeframe |
| Status | Open / Completed / Overdue / Snoozed |
| Snooze until | Date if snoozed |
| Source | Meeting or conversation reference |

---

## partners.md

| Field | Description |
|---|---|
| Name | Partner/vendor company name |
| Area | Which product area(s) it serves |
| Status | Active / Exploratory / Inactive |
| Relationship owner | Gusto point of contact (day-to-day) |
| Brandon's role | Strategy / Contract / Renewal / Monitor |
| Key risks | Known risks or watch items |
| Next milestone | Nearest actionable date or event |

---

## projects.md

| Field | Description |
|---|---|
| Name | Project/workstream name |
| Status | Active / On hold / Complete |
| Brandon's role | Owner / Contributor / Informed |
| Key people | PM, PE, partner managers involved |
| Current focus | Top 2–3 active threads |
| Notes | Context, history, watch items |

---

## priorities.md

| Field | Description |
|---|---|
| Area | Product area or workstream |
| Rank | Relative priority (1 = highest) |
| Always surface | Items that should always be P0 |
| Track quietly | Items that are P2 unless urgent |

---

## surfaced_log.md

| Field | Description |
|---|---|
| Date | YYYY-MM-DD |
| Type | Brief / Ad-hoc / Onboarding |
| Items | List of what was surfaced |
| Priority band | P0–P3 for each item |

---

## Importance Tiers

| Level | Description |
|---|---|
| P0 | Critical now — exec-visible, time-sensitive, or legal/reputational risk |
| P1 | Important this week — meaningful impact, user action required soon |
| P2 | Track — relevant context, no immediate action needed |
| P3 | Background/noise — low impact or out of scope |
