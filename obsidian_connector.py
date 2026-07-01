"""
obsidian_connector.py
Maximus · Obsidian REST API integration

Requires:
  - Obsidian open and running
  - Local REST API plugin installed (by coddingtonbear)
  - API key stored as environment variable OBSIDIAN_API_KEY
  - HTTP server enabled on port 27123 in plugin settings

Usage:
  from obsidian_connector import read_note, write_note, append_to_note
"""

import os
import requests
from datetime import datetime

# ── Config ────────────────────────────────────────────────────────────────────
OBSIDIAN_HOST = "http://127.0.0.1:27123"
OBSIDIAN_API_KEY = os.environ.get("OBSIDIAN_API_KEY", "")

HEADERS = {
    "Authorization": f"Bearer {OBSIDIAN_API_KEY}",
    "Content-Type": "text/markdown",
}


# ── Core functions ────────────────────────────────────────────────────────────

def obsidian_is_running() -> bool:
    """
    Check if Obsidian is open and the REST API is reachable.
    Always call this first before any vault operation.
    """
    try:
        response = requests.get(OBSIDIAN_HOST, headers=HEADERS, timeout=2)
        return response.status_code in (200, 401)
    except requests.exceptions.ConnectionError:
        return False


def read_note(path: str) -> object:
    """
    Read a note from the vault.

    Args:
        path: Relative path from vault root, e.g. "10-Partners/ZenBusiness.md"

    Returns:
        Note content as a string, or None if not found.

    Example:
        content = read_note("10-Partners/ZenBusiness.md")
    """
    url = f"{OBSIDIAN_HOST}/vault/{path}"
    response = requests.get(url, headers=HEADERS)

    if response.status_code == 200:
        return response.text
    elif response.status_code == 404:
        print(f"[Obsidian] Note not found: {path}")
        return None
    else:
        print(f"[Obsidian] Error reading {path}: {response.status_code}")
        return None


def write_note(path: str, content: str) -> bool:
    """
    Create or fully overwrite a note.
    Warning: replaces the entire note. Use append_to_note to add content.

    Args:
        path:    Relative path from vault root, e.g. "00-Inbox/quick-note.md"
        content: Full markdown content to write

    Returns:
        True if successful, False otherwise.

    Example:
        write_note("00-Inbox/quick-note.md", "# Quick note\n\nSomething to remember.")
    """
    url = f"{OBSIDIAN_HOST}/vault/{path}"
    response = requests.put(url, headers=HEADERS, data=content.encode("utf-8"))

    if response.status_code in (200, 204):
        print(f"[Obsidian] Written: {path}")
        return True
    else:
        print(f"[Obsidian] Error writing {path}: {response.status_code}")
        return False


def append_to_note(path: str, content: str) -> bool:
    """
    Append content to the end of an existing note.
    If the note does not exist, it will be created.

    Args:
        path:    Relative path from vault root, e.g. "10-Partners/ZenBusiness.md"
        content: Markdown content to append

    Returns:
        True if successful, False otherwise.

    Example:
        append_to_note(
            "10-Partners/ZenBusiness.md",
            "\n## Meeting notes · 2026-07-01\n\n- Discussed beta go-live timeline\n"
        )
    """
    url = f"{OBSIDIAN_HOST}/vault/{path}"
    response = requests.post(url, headers=HEADERS, data=content.encode("utf-8"))

    if response.status_code in (200, 204):
        print(f"[Obsidian] Appended to: {path}")
        return True
    else:
        print(f"[Obsidian] Error appending to {path}: {response.status_code}")
        return False


def list_notes(folder: str) -> object:
    """
    List all notes in a vault folder.

    Args:
        folder: Relative folder path, e.g. "10-Partners" or "30-Deals"

    Returns:
        List of file paths, or None on error.

    Example:
        notes = list_notes("10-Partners")
    """
    url = f"{OBSIDIAN_HOST}/vault/{folder}/"
    response = requests.get(url, headers=HEADERS)

    if response.status_code == 200:
        data = response.json()
        return [f["path"] for f in data.get("files", [])]
    else:
        print(f"[Obsidian] Error listing {folder}: {response.status_code}")
        return None


# ── Example routine: pre-meeting brief ───────────────────────────────────────

def pre_meeting_brief(
    partner_name: str,
    meeting_context: str = "",
    stakeholder_names: list = None,
    product_name: str = None,
) -> str:
    """
    Read partner, stakeholder, and product context from vault, generate a
    pre-meeting brief, and append it back to the partner note.

    Args:
        partner_name:      Exact filename without .md, e.g. "ZenBusiness"
        meeting_context:   Optional meeting title or agenda from calendar
        stakeholder_names: Optional list of stakeholder filenames without .md,
                           e.g. ["Chris-Elkins", "Farron-Hicks"]
                           Reads from 40-Stakeholders/ folder.
        product_name:      Optional product filename without .md, e.g. "Gusto-Pro"
                           Reads from 20-Products/ folder.

    Returns:
        Brief as a markdown string for posting to Slack.

    Example:
        brief = pre_meeting_brief(
            partner_name="ZenBusiness",
            meeting_context="ZenBiz beta go-live sync with Izzy",
            stakeholder_names=["Chris-Elkins", "Farron-Hicks"],
            product_name="Start Your Business (SYB)",
        )
    """
    if not obsidian_is_running():
        return "[Obsidian not running: open Obsidian to enable vault context]"

    partner_note = read_note(f"10-Partners/{partner_name}.md") or ""

    stakeholder_block = ""
    for name in (stakeholder_names or []):
        note = read_note(f"40-Stakeholders/{name}.md")
        if note:
            stakeholder_block += f"\n--- STAKEHOLDER: {name} ---\n{note[:1000]}\n"

    product_note = ""
    if product_name:
        product_note = read_note(f"20-Products/{product_name}.md") or ""

    today = datetime.now().strftime("%B %d, %Y")

    prompt = f"""
You are Maximus, Brandon Reich's briefing agent at Gusto.

Today is {today}. Brandon has a meeting coming up in 30 minutes.
Meeting context: {meeting_context or "partner call"}

Generate a tight pre-meeting brief (5-8 bullets max) covering:
- Relationship status and recent history
- Open threads or unresolved items
- Key commercial context (renewal dates, financial terms, risks)
- What Brandon should push for or watch out for in this meeting
- Any action items from last interaction that should be followed up

Format: markdown bullets only, no headers, no prose paragraphs.
Be direct. Brandon has ADHD: scannable is better than comprehensive.
Do not use em-dashes.

--- PARTNER NOTE ---
{partner_note[:3000] if partner_note else "No partner note found."}
{stakeholder_block}
--- PRODUCT NOTE ---
{product_note[:1500] if product_note else "No product note provided."}
"""

    import anthropic
    client = anthropic.Anthropic()

    message = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=600,
        messages=[{"role": "user", "content": prompt}]
    )
    brief = message.content[0].text

    today_stamp = datetime.now().strftime("%Y-%m-%d")
    append_to_note(
        f"10-Partners/{partner_name}.md",
        f"\n---\n## Pre-meeting brief · {today_stamp}\n\n{brief}\n"
    )

    return brief


# ── Example routine: post-meeting summary writer ─────────────────────────────

def write_meeting_summary(
    partner_name: str,
    granola_transcript: str,
    meeting_date: str = None
) -> bool:
    """
    Parse a Granola meeting transcript and append a structured summary
    to the relevant partner note.

    Args:
        partner_name:       Exact filename without .md, e.g. "ZenBusiness"
        granola_transcript: Raw transcript text from Granola
        meeting_date:       ISO date string, defaults to today

    Returns:
        True if written successfully.

    Example:
        write_meeting_summary(
            partner_name="ZenBusiness",
            granola_transcript=transcript_text,
            meeting_date="2026-07-01"
        )
    """
    if not obsidian_is_running():
        print("[Obsidian] Not running: cannot write meeting summary")
        return False

    date = meeting_date or datetime.now().strftime("%Y-%m-%d")

    prompt = f"""
Extract a structured meeting summary from this transcript.

Output ONLY the following markdown, nothing else:

## Meeting · {date}

**Key takeaways:**
- [bullet]

**Decisions made:**
- [bullet or "None"]

**Action items:**
- [ ] [action] (owner) · due: [date or TBD]

**Relationship temperature:** [Warm / Neutral / Tense: one word + one sentence]

Do not use em-dashes anywhere in the output.

--- TRANSCRIPT ---
{granola_transcript[:4000]}
"""

    import anthropic
    client = anthropic.Anthropic()

    message = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=500,
        messages=[{"role": "user", "content": prompt}]
    )
    summary = message.content[0].text

    return append_to_note(f"10-Partners/{partner_name}.md", f"\n{summary}\n")


# ── Example routine: renewal radar ───────────────────────────────────────────

def renewal_radar(days_warning: int = 90) -> list:
    """
    Scan all partner notes for contract renewal dates within the warning window.
    Run this weekly as part of the Monday portfolio pulse.

    Args:
        days_warning: Flag renewals within this many days (default 90)

    Returns:
        List of dicts with partner name, renewal date, and days out.

    Example:
        flagged = renewal_radar(days_warning=90)
        for p in flagged:
            print(f"{p['partner']}: renewal on {p['date']} ({p['days_out']} days)")
    """
    import re
    from datetime import timedelta

    if not obsidian_is_running():
        return []

    notes = list_notes("10-Partners")
    if not notes:
        return []

    flagged = []
    today = datetime.now()
    cutoff = today + timedelta(days=days_warning)

    for note_path in notes:
        content = read_note(note_path)
        if not content:
            continue

        match = re.search(r"contract_renewal:\s*(\d{4}-\d{2}-\d{2})", content)
        if match:
            renewal_str = match.group(1)
            try:
                renewal_date = datetime.strptime(renewal_str, "%Y-%m-%d")
                if today <= renewal_date <= cutoff:
                    days_out = (renewal_date - today).days
                    partner_name = note_path.replace("10-Partners/", "").replace(".md", "")
                    flagged.append({
                        "partner": partner_name,
                        "date": renewal_str,
                        "days_out": days_out,
                    })
            except ValueError:
                continue

    flagged.sort(key=lambda x: x["days_out"])
    return flagged
