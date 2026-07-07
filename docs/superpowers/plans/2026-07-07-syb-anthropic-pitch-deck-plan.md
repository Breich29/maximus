# SYB × Anthropic Pitch Deck Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the "Gusto × Anthropic — Start Your Business" HTML pitch deck, publish it to share-some-html, and record the deck's location in both the auto-memory system and the Obsidian SYB product note.

**Architecture:** A single self-contained HTML file (`decks/gusto-anthropic-entity-formation.html`) built by copying the existing `tmp_deck_updated.html` shell (fonts, colors, slide/nav/speaker-notes/comments mechanics) verbatim, then replacing its accountant-deck slide content with 11 new SYB slides written in this plan. No build tooling, no dependencies beyond Google Fonts — this is a static artifact.

**Tech Stack:** Plain HTML/CSS/JS (no frameworks), share-some-html MCP tools for publishing.

This is a content-authoring plan, not a software-logic plan — there is no application code to unit test. "Tests" in this plan are `grep`/`wc` assertions against the HTML file (verifying slide count, verifying required content is present, verifying forbidden content is absent) plus a manual visual check by opening the file in a browser. Every content string used below is real, taken from the approved spec — nothing is invented at implementation time.

## Global Constraints

- Reuse the exact CSS/JS shell from `tmp_deck_updated.html` verbatim: DM Sans + DM Serif Display fonts, `--gusto-coral: #F45D3B` accent, `.slide`/dot-nav/keyboard-arrow mechanics, speaker-notes panel, comment panel.
- No mention of "ZenBusiness" or any specific entity-formation vendor anywhere in the deck. Entity formation is described only as "Gusto-powered."
- No explicit GA/roadmap date (e.g. "H1 2027", "2027") anywhere in the deck. SYB is written about in the present tense, as a capability Gusto is building/has now.
- The demo block (Slide 5) and the frequency-of-use stat are the only approved placeholders — both must be visually flagged as pending, not presented as finished facts.
- Slides for "What Gusto Will Build" (Slides 6–8) must each carry an "INTERNAL — OPTION FOR REVIEW" banner — this is a Gusto-internal working set, not a menu to present as open to Anthropic.
- localStorage comment keys must not collide with the sibling accountant deck: use prefix `slide-comments-syb-ef:` (the accountant deck uses `slide-comments-acct:`).
- share-some-html slug: `gusto-anthropic-entity-formation`. Page title: "Gusto × Anthropic — Start Your Business".
- Source citations required on any slide using external data: U.S. Census Bureau Business Formation Statistics (2025) and Gusto's 2026 New Business Formation Report (gusto.com/resources/gusto-insights/new-business-formation-2026).

---

### Task 1: Scaffold the deck shell + Cover slide

**Files:**
- Create: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Produces: a working single-slide HTML deck with the full CSS shell, JS nav/notes/comments logic (comment key prefix `slide-comments-syb-ef:`), and a `NOTES` array with one entry (index 0, the cover slide). Later tasks insert additional `<div class="slide">` blocks before the `</div>` that closes `.slideshow`, and append entries to `NOTES` before its closing `];`.

- [ ] **Step 1: Create the decks directory**

```bash
mkdir -p /Users/brandon.reich/maximus/decks
```

- [ ] **Step 2: Write the full file**

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gusto × Anthropic — Start Your Business</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root { --gusto-coral: #F45D3B; --gusto-coral-light: #FEF0EC; --text-primary: #1A1A1A; --text-secondary: #5A5A5A; --text-muted: #9A9A9A; --surface: #FFFFFF; --surface-soft: #F8F7F4; --surface-warm: #FDF9F6; --border: rgba(0,0,0,0.08); --border-strong: rgba(0,0,0,0.15); }
  html, body { height: 100%; overflow: hidden; }
  body { font-family: 'DM Sans', sans-serif; background: #1A1A1A; color: var(--text-primary); line-height: 1.6; display: flex; flex-direction: column; align-items: center; justify-content: center; }
  .slideshow { width: 100vw; height: 100vh; display: flex; align-items: center; justify-content: center; }
  .slide { display: none; background: var(--surface); border-radius: 16px; padding: 60px 68px; width: min(980px, 92vw); max-height: 90vh; overflow-y: auto; position: relative; border: 0.5px solid var(--border); scrollbar-width: thin; scrollbar-color: var(--border) transparent; }
  .slide.active { display: flex; flex-direction: column; justify-content: center; }
  .nav { position: fixed; bottom: 28px; left: 50%; transform: translateX(-50%); display: flex; align-items: center; gap: 16px; z-index: 100; }
  .nav-btn { width: 40px; height: 40px; border-radius: 50%; border: none; background: rgba(255,255,255,0.12); color: rgba(255,255,255,0.8); cursor: pointer; display: flex; align-items: center; justify-content: center; transition: background 0.15s; font-size: 16px; }
  .nav-btn:hover { background: rgba(255,255,255,0.22); }
  .nav-btn:disabled { opacity: 0.25; cursor: default; }
  .slide-counter { font-size: 12px; color: rgba(255,255,255,0.45); letter-spacing: 0.08em; min-width: 52px; text-align: center; font-family: 'DM Sans', sans-serif; }
  .dots { position: fixed; bottom: 76px; left: 50%; transform: translateX(-50%); display: flex; gap: 6px; z-index: 100; }
  .dot { width: 5px; height: 5px; border-radius: 50%; background: rgba(255,255,255,0.2); cursor: pointer; transition: background 0.15s, transform 0.15s; }
  .dot.active { background: var(--gusto-coral); transform: scale(1.3); }
  .hint { position: fixed; top: 20px; right: 24px; font-size: 11px; color: rgba(255,255,255,0.25); letter-spacing: 0.05em; font-family: 'DM Sans', sans-serif; }
  .slide-number { position: absolute; top: 28px; right: 36px; font-size: 12px; color: var(--text-muted); letter-spacing: 0.08em; font-weight: 400; }
  .eyebrow { font-size: 11px; letter-spacing: 0.12em; text-transform: uppercase; color: var(--gusto-coral); font-weight: 500; margin-bottom: 20px; }
  .display { font-family: 'DM Serif Display', serif; font-size: 52px; line-height: 1.1; color: var(--text-primary); letter-spacing: -0.01em; }
  .display em { font-style: italic; color: var(--gusto-coral); }
  .display-md { font-family: 'DM Serif Display', serif; font-size: 38px; line-height: 1.15; color: var(--text-primary); letter-spacing: -0.01em; margin-bottom: 20px; }
  .display-md em { font-style: italic; color: var(--gusto-coral); }
  .body-lg { font-size: 18px; color: var(--text-secondary); line-height: 1.65; max-width: 620px; }
  .body { font-size: 15px; color: var(--text-secondary); line-height: 1.7; }
  .divider { width: 40px; height: 2px; background: var(--gusto-coral); margin: 24px 0; }
  .slide-cover { background: var(--text-primary); }
  .slide-cover .eyebrow { color: rgba(255,255,255,0.45); }
  .slide-cover .display { color: #FFFFFF; font-size: 58px; }
  .slide-cover .display em { color: #F87B5A; }
  .slide-cover .body-lg { color: rgba(255,255,255,0.55); }
  .slide-cover .divider { background: rgba(255,255,255,0.15); }
  .cover-lockup { display: flex; align-items: center; gap: 12px; margin-bottom: 40px; }
  .logo-pill { font-size: 13px; font-weight: 500; padding: 6px 14px; border-radius: 100px; border: 1px solid rgba(255,255,255,0.2); color: rgba(255,255,255,0.7); }
  .logo-sep { color: rgba(255,255,255,0.2); font-size: 18px; }
  .two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: start; }
  .three-col { display: grid; grid-template-columns: repeat(3, 1fr); gap: 14px; }
  .stat-card { background: var(--surface-soft); border-radius: 12px; padding: 20px 22px; border: 0.5px solid var(--border); }
  .stat-card .number { font-family: 'DM Serif Display', serif; font-size: 36px; color: var(--text-primary); line-height: 1; margin-bottom: 6px; }
  .stat-card .label { font-size: 13px; color: var(--text-muted); line-height: 1.4; }
  .quote-block { background: var(--surface-soft); border-left: 3px solid var(--gusto-coral); border-radius: 0 12px 12px 0; padding: 18px 22px; margin: 18px 0; }
  .quote-block p { font-family: 'DM Serif Display', serif; font-style: italic; font-size: 17px; color: var(--text-primary); line-height: 1.5; margin-bottom: 6px; }
  .quote-block cite { font-size: 12px; color: var(--text-muted); font-style: normal; letter-spacing: 0.05em; }
  .slide-accent { position: absolute; top: 0; left: 0; right: 0; height: 3px; background: var(--gusto-coral); border-radius: 16px 16px 0 0; }
  .source-note { font-size: 11px; color: var(--text-muted); margin-top: 14px; font-style: italic; }
  .br { display: flex; align-items: flex-start; gap: 10px; font-size: 13px; color: var(--text-secondary); line-height: 1.55; }
  .dot6 { width: 6px; height: 6px; border-radius: 50%; background: var(--gusto-coral); flex-shrink: 0; margin-top: 6px; }

  /* Speaker notes button */
  .notes-btn { position: fixed; top: 20px; left: 130px; background: rgba(255,255,255,0.12); border: none; border-radius: 20px; padding: 7px 14px; color: rgba(255,255,255,0.7); font-size: 12px; font-family: 'DM Sans', sans-serif; cursor: pointer; display: flex; align-items: center; gap: 6px; transition: background 0.15s; z-index: 200; }
  .notes-btn:hover { background: rgba(255,255,255,0.22); }
  .notes-btn.on { background: rgba(244,93,59,0.25); color: #F87B5A; }
  .comment-btn { position: fixed; top: 20px; left: 24px; background: rgba(255,255,255,0.12); border: none; border-radius: 20px; padding: 7px 14px; color: rgba(255,255,255,0.7); font-size: 12px; font-family: 'DM Sans', sans-serif; cursor: pointer; display: flex; align-items: center; gap: 6px; transition: background 0.15s; z-index: 200; }
  .comment-btn:hover { background: rgba(255,255,255,0.22); }
  .comment-btn .badge { background: var(--gusto-coral); border-radius: 10px; padding: 1px 6px; font-size: 10px; color: white; font-weight: 600; display: none; }
  .comment-btn .badge.visible { display: inline; }

  /* Notes panel */
  .notes-panel { position: fixed; top: 0; right: -440px; width: 420px; height: 100vh; background: #0D0D0D; border-left: 1px solid rgba(255,255,255,0.07); z-index: 300; display: flex; flex-direction: column; transition: right 0.25s ease; font-family: 'DM Sans', sans-serif; }
  .notes-panel.open { right: 0; }
  .np-header { padding: 20px 20px 16px; border-bottom: 1px solid rgba(255,255,255,0.07); display: flex; align-items: center; justify-content: space-between; }
  .np-title { font-size: 13px; font-weight: 500; color: rgba(255,255,255,0.8); }
  .np-sub { font-size: 11px; color: rgba(255,255,255,0.28); margin-top: 2px; }
  .np-close { background: none; border: none; color: rgba(255,255,255,0.35); cursor: pointer; font-size: 18px; line-height: 1; padding: 4px; }
  .np-close:hover { color: rgba(255,255,255,0.7); }
  .np-body { flex: 1; overflow-y: auto; padding: 20px; scrollbar-width: thin; scrollbar-color: rgba(255,255,255,0.08) transparent; }
  .np-meta { display: flex; align-items: center; gap: 10px; margin-bottom: 14px; }
  .np-speaker { font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; }
  .np-time { font-size: 11px; color: rgba(255,255,255,0.28); }
  .np-text { font-size: 13px; color: rgba(255,255,255,0.7); line-height: 1.78; white-space: pre-wrap; }
  .np-watch { background: rgba(244,93,59,0.07); border-left: 2px solid rgba(244,93,59,0.35); border-radius: 0 8px 8px 0; padding: 10px 14px; margin-top: 18px; font-size: 12px; color: rgba(255,255,255,0.42); line-height: 1.65; white-space: pre-wrap; }

  /* Comment panel */
  .comment-panel { position: fixed; top: 0; right: -380px; width: 360px; height: 100vh; background: #1F1F1F; border-left: 1px solid rgba(255,255,255,0.08); z-index: 300; display: flex; flex-direction: column; transition: right 0.25s ease; font-family: 'DM Sans', sans-serif; }
  .comment-panel.open { right: 0; }
  .panel-header { padding: 20px 20px 16px; border-bottom: 1px solid rgba(255,255,255,0.08); display: flex; align-items: center; justify-content: space-between; }
  .panel-title { font-size: 13px; font-weight: 500; color: rgba(255,255,255,0.8); }
  .panel-slide-label { font-size: 11px; color: rgba(255,255,255,0.3); margin-top: 2px; }
  .panel-close { background: none; border: none; color: rgba(255,255,255,0.4); cursor: pointer; font-size: 18px; line-height: 1; padding: 4px; }
  .panel-close:hover { color: rgba(255,255,255,0.8); }
  .comments-list { flex: 1; overflow-y: auto; padding: 16px 20px; display: flex; flex-direction: column; gap: 12px; scrollbar-width: thin; scrollbar-color: rgba(255,255,255,0.1) transparent; }
  .comment-empty { text-align: center; color: rgba(255,255,255,0.25); font-size: 13px; padding: 32px 0; line-height: 1.6; }
  .comment-item { background: rgba(255,255,255,0.06); border-radius: 10px; padding: 12px 14px; position: relative; }
  .comment-meta { display: flex; align-items: center; justify-content: space-between; margin-bottom: 6px; }
  .comment-author { font-size: 12px; font-weight: 500; color: var(--gusto-coral); }
  .comment-time { font-size: 11px; color: rgba(255,255,255,0.25); }
  .comment-text { font-size: 13px; color: rgba(255,255,255,0.75); line-height: 1.55; }
  .comment-delete { position: absolute; top: 8px; right: 8px; background: none; border: none; color: rgba(255,255,255,0.2); cursor: pointer; font-size: 14px; padding: 2px 4px; border-radius: 4px; display: none; }
  .comment-item:hover .comment-delete { display: block; }
  .comment-delete:hover { color: rgba(255,255,255,0.6); background: rgba(255,255,255,0.08); }
  .comment-input-area { padding: 14px 20px 20px; border-top: 1px solid rgba(255,255,255,0.08); display: flex; flex-direction: column; gap: 10px; }
  .comment-name-input { background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 8px 12px; color: rgba(255,255,255,0.8); font-size: 12px; font-family: 'DM Sans', sans-serif; outline: none; width: 100%; }
  .comment-name-input:focus { border-color: rgba(255,255,255,0.25); }
  .comment-name-input::placeholder { color: rgba(255,255,255,0.25); }
  .comment-textarea { background: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 10px 12px; color: rgba(255,255,255,0.8); font-size: 13px; font-family: 'DM Sans', sans-serif; outline: none; resize: none; width: 100%; min-height: 72px; line-height: 1.5; }
  .comment-textarea:focus { border-color: rgba(255,255,255,0.25); }
  .comment-textarea::placeholder { color: rgba(255,255,255,0.25); }
  .comment-submit { background: var(--gusto-coral); border: none; border-radius: 8px; padding: 9px 16px; color: white; font-size: 13px; font-weight: 500; font-family: 'DM Sans', sans-serif; cursor: pointer; align-self: flex-end; transition: opacity 0.15s; }
  .comment-submit:hover { opacity: 0.88; }
  .comment-submit:disabled { opacity: 0.4; cursor: default; }
  .overlay { position: fixed; inset: 0; background: rgba(0,0,0,0); z-index: 250; pointer-events: none; transition: background 0.25s; }
  .overlay.active { background: rgba(0,0,0,0.4); pointer-events: all; }
</style>
</head>
<body>
<div class="hint">← → to navigate &nbsp;·&nbsp; S for speaker notes</div>
<div class="slideshow">

  <!-- 1: Cover -->
  <div class="slide slide-cover active">
    <div class="cover-lockup"><span class="logo-pill">Gusto</span><span class="logo-sep">×</span><span class="logo-pill">Anthropic</span></div>
    <div class="eyebrow">Partnership Proposal</div>
    <h1 class="display">Start Your<br><em>Business.</em></h1>
    <div class="divider"></div>
    <p class="body-lg">The missing category in the SMB stack — entity formation, powered by Gusto, built natively into Claude.</p>
    <p style="margin-top: 28px; font-size: 12px; color: rgba(255,255,255,0.18); letter-spacing: 0.06em;">CONFIDENTIAL · JULY 2026</p>
  </div>

</div>

<div class="dots" id="dots"></div>
<div class="nav">
  <button class="nav-btn" id="prev" onclick="changeSlide(-1)">&#8592;</button>
  <span class="slide-counter" id="counter">1 / 12</span>
  <button class="nav-btn" id="next" onclick="changeSlide(1)">&#8594;</button>
</div>

<button class="comment-btn" onclick="openPanel('comments')" id="commentBtn">
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none"><path d="M1 1h12v9H8l-4 3V10H1V1z" stroke="currentColor" stroke-width="1.2" stroke-linejoin="round"/></svg>
  Comments
  <span class="badge" id="commentBadge">0</span>
</button>

<button class="notes-btn" onclick="openPanel('notes')" id="notesBtn">
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none"><path d="M2 3h10M2 7h7M2 11h5" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/></svg>
  Speaker notes
</button>

<div class="overlay" id="overlay" onclick="closeAllPanels()"></div>

<div class="notes-panel" id="notesPanel">
  <div class="np-header">
    <div><div class="np-title">Speaker Notes</div><div class="np-sub" id="npSlideLabel">Slide 1</div></div>
    <button class="np-close" onclick="closeAllPanels()">×</button>
  </div>
  <div class="np-body" id="npBody"></div>
</div>

<div class="comment-panel" id="commentPanel">
  <div class="panel-header">
    <div><div class="panel-title">Comments</div><div class="panel-slide-label" id="panelSlideLabel">Slide 1</div></div>
    <button class="panel-close" onclick="closeAllPanels()">×</button>
  </div>
  <div class="comments-list" id="commentsList"></div>
  <div class="comment-input-area">
    <input class="comment-name-input" id="commentName" placeholder="Your name" maxlength="40" />
    <textarea class="comment-textarea" id="commentText" placeholder="Leave a comment on this slide..." maxlength="500"></textarea>
    <button class="comment-submit" id="commentSubmit" onclick="submitComment()">Post comment</button>
  </div>
</div>

<script>
const NOTES = [
  { speaker: 'Izzy', time: '~1 min', text: '"Thanks for making time. Today we want to show you the missing category in the SMB stack: entity formation. We think if Claude can help someone start their business, it becomes the reason they stay with Claude for everything that comes after."', watch: null }
];

const slides = document.querySelectorAll('.slide');
const total = slides.length;
let current = 0;
let activePanel = null;
const dotsEl = document.getElementById('dots');

slides.forEach((_, i) => {
  const d = document.createElement('div');
  d.className = 'dot' + (i === 0 ? ' active' : '');
  d.onclick = () => goTo(i);
  dotsEl.appendChild(d);
});

function goTo(n) {
  slides[current].classList.remove('active');
  dotsEl.children[current].classList.remove('active');
  current = Math.max(0, Math.min(n, total - 1));
  slides[current].classList.add('active');
  slides[current].scrollTop = 0;
  dotsEl.children[current].classList.add('active');
  document.getElementById('counter').textContent = (current + 1) + ' / ' + total;
  document.getElementById('prev').disabled = current === 0;
  document.getElementById('next').disabled = current === total - 1;
  if (activePanel === 'notes') renderNotes();
  if (activePanel === 'comments') loadComments();
}
function changeSlide(dir) { goTo(current + dir); }

document.addEventListener('keydown', e => {
  if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;
  if (e.key === 'ArrowRight' || e.key === 'ArrowDown') changeSlide(1);
  if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') changeSlide(-1);
  if (e.key === 's' || e.key === 'S') openPanel(activePanel === 'notes' ? null : 'notes');
  if (e.key === 'Escape') closeAllPanels();
});

goTo(0);

function openPanel(which) {
  closeAllPanels(true);
  if (!which) return;
  activePanel = which;
  document.getElementById('overlay').classList.add('active');
  if (which === 'notes') {
    document.getElementById('notesPanel').classList.add('open');
    document.getElementById('notesBtn').classList.add('on');
    renderNotes();
  } else {
    document.getElementById('commentPanel').classList.add('open');
    loadComments();
  }
}

function closeAllPanels(silent) {
  activePanel = null;
  document.getElementById('notesPanel').classList.remove('open');
  document.getElementById('commentPanel').classList.remove('open');
  document.getElementById('notesBtn').classList.remove('on');
  if (!silent) document.getElementById('overlay').classList.remove('active');
}

function renderNotes() {
  const n = NOTES[current] || {};
  const label = 'Slide ' + (current + 1) + ' of ' + total;
  document.getElementById('npSlideLabel').textContent = label;
  let html = '';
  if (n.speaker) html += `<div class="np-meta"><span class="np-speaker">${n.speaker}</span><span class="np-time">${n.time}</span></div>`;
  html += `<div class="np-text">${escHtml(n.text || '')}</div>`;
  if (n.watch) html += `<div class="np-watch">${escHtml(n.watch)}</div>`;
  document.getElementById('npBody').innerHTML = html;
}

try { document.getElementById('commentName').value = localStorage.getItem('commenter_name') || ''; } catch(e) {}

const _storage = window.storage || {
  get: async (key) => { try { const v = localStorage.getItem(key); return v ? { value: v } : null; } catch(e) { return null; } },
  set: async (key, value) => { try { localStorage.setItem(key, value); } catch(e) {} }
};

function getSlideKey(idx) { return 'slide-comments-syb-ef:' + idx; }

async function loadComments() {
  const idx = current;
  document.getElementById('panelSlideLabel').textContent = 'Slide ' + (idx + 1) + ' of ' + total;
  const list = document.getElementById('commentsList');
  list.innerHTML = '<div class="comment-empty">Loading...</div>';
  try {
    const result = await _storage.get(getSlideKey(idx), true);
    const comments = result ? JSON.parse(result.value) : [];
    renderComments(comments, idx);
    updateBadge(comments.length);
  } catch(e) { renderComments([], idx); }
}

function renderComments(comments, idx) {
  const list = document.getElementById('commentsList');
  if (!comments.length) { list.innerHTML = '<div class="comment-empty">No comments on this slide yet.<br>Be the first to leave a note.</div>'; return; }
  list.innerHTML = comments.map((c, i) => `<div class="comment-item"><div class="comment-meta"><span class="comment-author">${escHtml(c.author)}</span><span class="comment-time">${c.time}</span></div><div class="comment-text">${escHtml(c.text)}</div><button class="comment-delete" onclick="deleteComment(${idx},${i})" title="Delete">×</button></div>`).join('');
  list.scrollTop = list.scrollHeight;
}

function escHtml(str) { return (str||'').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;'); }

async function submitComment() {
  const name = document.getElementById('commentName').value.trim();
  const text = document.getElementById('commentText').value.trim();
  if (!name || !text) return;
  try { localStorage.setItem('commenter_name', name); } catch(e) {}
  const btn = document.getElementById('commentSubmit');
  btn.disabled = true; btn.textContent = 'Posting...';
  const idx = current;
  try {
    let comments = [];
    try { const r = await _storage.get(getSlideKey(idx), true); if (r) comments = JSON.parse(r.value); } catch(e) {}
    const now = new Date();
    const timeStr = now.toLocaleDateString('en-US',{month:'short',day:'numeric'}) + ' · ' + now.toLocaleTimeString('en-US',{hour:'numeric',minute:'2-digit'});
    comments.push({ author: name, text, time: timeStr });
    await _storage.set(getSlideKey(idx), JSON.stringify(comments), true);
    document.getElementById('commentText').value = '';
    renderComments(comments, idx);
    updateBadge(comments.length);
  } catch(e) { alert('Could not save comment.'); }
  btn.disabled = false; btn.textContent = 'Post comment';
}

async function deleteComment(idx, i) {
  if (!confirm('Delete this comment?')) return;
  try {
    const r = await _storage.get(getSlideKey(idx), true);
    let comments = r ? JSON.parse(r.value) : [];
    comments.splice(i, 1);
    await _storage.set(getSlideKey(idx), JSON.stringify(comments), true);
    renderComments(comments, idx);
    updateBadge(comments.length);
  } catch(e) {}
}

function updateBadge(count) {
  const badge = document.getElementById('commentBadge');
  badge.textContent = count;
  badge.classList.toggle('visible', count > 0);
}

document.getElementById('commentText').addEventListener('keydown', e => {
  if ((e.metaKey || e.ctrlKey) && e.key === 'Enter') submitComment();
});
</script>
</body>
</html>
```

- [ ] **Step 3: Verify slide count and structure**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `1`

- [ ] **Step 4: Open in browser and visually confirm**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: dark cover slide reading "Start Your Business", coral "×" between Gusto/Anthropic pills, counter reads "1 / 1", left/right arrow keys don't error (there's only one slide, so nav buttons should be disabled).

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Scaffold SYB x Anthropic deck shell + cover slide"
```

---

### Task 2: Slide 2 — The Market

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: the `.slideshow` div and `NOTES` array produced by Task 1.
- Produces: slide index 1 (second slide) and `NOTES[1]`.

- [ ] **Step 1: Insert the slide markup**

Find this exact text (the closing of the cover slide + closing of `.slideshow`):

```html
    <p style="margin-top: 28px; font-size: 12px; color: rgba(255,255,255,0.18); letter-spacing: 0.06em;">CONFIDENTIAL · JULY 2026</p>
  </div>

</div>
```

Replace it with:

```html
    <p style="margin-top: 28px; font-size: 12px; color: rgba(255,255,255,0.18); letter-spacing: 0.06em;">CONFIDENTIAL · JULY 2026</p>
  </div>

  <!-- 2: The Market -->
  <div class="slide">
    <div class="slide-accent"></div>
    <span class="slide-number">01</span>
    <div class="eyebrow">The market</div>
    <div class="two-col">
      <div>
        <h2 class="display-md">5.7M businesses<br>started last year.<br><em>AI is accelerating it.</em></h2>
        <p class="body" style="margin-bottom: 12px;">New business formation in the U.S. has climbed for two decades straight — and it just hit a record high. This isn't a blip. It's a structural shift in who starts a business and how.</p>
        <p class="body" style="margin-bottom: 12px;">Gusto's own 2026 New Business Formation Report found that 60% of new founders used AI to help launch — double the rate from 2023 — and three in four of them used it to develop the business idea itself, the exact moment Claude already owns.</p>
        <p class="body" style="font-weight: 500; color: var(--text-primary);">More people are starting businesses, with AI's help, than ever before. The only question is which platform they finish the journey on.</p>
      </div>
      <div>
        <div style="display: flex; flex-direction: column; gap: 12px; margin-bottom: 16px;">
          <div class="stat-card"><div class="number">5.7M</div><div class="label">New business applications filed in the U.S. in 2025 — a record high</div></div>
          <div class="stat-card"><div class="number">400%+</div><div class="label">Growth in monthly new business applications since 2004</div></div>
          <div class="stat-card"><div class="number">60%</div><div class="label">Of new founders used AI to help launch their business in 2025 — 2x the 2023 rate</div></div>
        </div>
        <div style="padding: 14px 18px; border-radius: 10px; border: 0.5px solid var(--border); background: var(--surface-soft); font-size: 13px; color: var(--text-secondary); line-height: 1.6;">
          Gen Z now starts more new businesses than Baby Boomers for the first time on record — and is 5x more likely to say AI was essential to getting started.
        </div>
      </div>
    </div>
    <p class="source-note">Source: U.S. Census Bureau, Business Formation Statistics (2025); Gusto 2026 New Business Formation Report</p>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find:

```html
const NOTES = [
  { speaker: 'Izzy', time: '~1 min', text: '"Thanks for making time. Today we want to show you the missing category in the SMB stack: entity formation. We think if Claude can help someone start their business, it becomes the reason they stay with Claude for everything that comes after."', watch: null }
];
```

Replace with:

```html
const NOTES = [
  { speaker: 'Izzy', time: '~1 min', text: '"Thanks for making time. Today we want to show you the missing category in the SMB stack: entity formation. We think if Claude can help someone start their business, it becomes the reason they stay with Claude for everything that comes after."', watch: null },
  { speaker: 'Izzy', time: '~2 min', text: '"5.7 million new businesses were started in the U.S. last year — a record. And AI is already part of how people get there: 60% of new founders used AI to help launch, double the rate from just two years ago. This market is large and it\'s growing specifically because of AI."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c '5.7M' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `2` then `2` (one in the stat card, one in the headline).

- [ ] **Step 4: Open in browser and click through to slide 2**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 2"; pressing → shows the Market slide with three stat cards (5.7M, 400%+, 60%) and the source note at the bottom.

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck Market slide"
```

---

### Task 3: Slide 3 — The Customer Problem

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 2 and `NOTES[1]` from Task 2.
- Produces: slide index 2 (third slide) and `NOTES[2]`.

- [ ] **Step 1: Insert the slide markup**

Find:

```html
    <p class="source-note">Source: U.S. Census Bureau, Business Formation Statistics (2025); Gusto 2026 New Business Formation Report</p>
  </div>

</div>
```

Replace with:

```html
    <p class="source-note">Source: U.S. Census Bureau, Business Formation Statistics (2025); Gusto 2026 New Business Formation Report</p>
  </div>

  <!-- 3: The Customer Problem -->
  <div class="slide">
    <span class="slide-number">02</span>
    <div class="eyebrow">The customer problem</div>
    <div class="two-col">
      <div>
        <h2 class="display-md">They come to Claude<br>with a passion.<br><em>Not yet a business.</em></h2>
        <p class="body" style="margin-bottom: 12px;">Someone comes to Claude excited about a product, a craft, a service — not about paperwork. But before they can run a business, they have to start one: entity formation, a registered agent, registration with the Secretary of State.</p>
        <p class="body" style="margin-bottom: 12px;">These are systems of action, not systems of advice. They require a real filing with a real government office — something a conversation alone can't complete.</p>
        <p class="body" style="font-weight: 500; color: var(--text-primary);">This is exactly where Claude can carry someone today — and exactly where it currently has to stop.</p>
        <div class="quote-block">
          <p>"Claude can take a founder 10% of the journey. It stalls exactly where the work becomes an action, not a conversation."</p>
          <cite>Gusto × Anthropic GEP walkthrough, 2026</cite>
        </div>
      </div>
      <div>
        <div style="padding: 16px 18px; border-radius: 10px; background: var(--surface-soft); border: 0.5px solid var(--border);">
          <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 8px;">Systems of action, not advice</div>
          <div style="display: flex; flex-direction: column; gap: 7px;">
            <div class="br"><span class="dot6"></span><span>LLC / corporation formation, filed with the state</span></div>
            <div class="br"><span class="dot6"></span><span>Registered agent designation</span></div>
            <div class="br"><span class="dot6"></span><span>EIN creation</span></div>
            <div class="br"><span class="dot6"></span><span>Secretary of State (SOS) registration</span></div>
          </div>
        </div>
        <div style="margin-top: 12px; padding: 14px 18px; border-radius: 10px; border: 0.5px solid var(--border); background: var(--surface-warm); font-size: 13px; color: var(--text-secondary); line-height: 1.6;">
          If Claude can't finish this step, the founder finishes it somewhere else — and picks the rest of their SMB stack there too.
        </div>
      </div>
    </div>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find the `NOTES` array's closing `];` and the entry just before it (Izzy's second entry from Task 2), and add a new entry after it:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"5.7 million new businesses were started in the U.S. last year — a record. And AI is already part of how people get there: 60% of new founders used AI to help launch, double the rate from just two years ago. This market is large and it\'s growing specifically because of AI."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"5.7 million new businesses were started in the U.S. last year — a record. And AI is already part of how people get there: 60% of new founders used AI to help launch, double the rate from just two years ago. This market is large and it\'s growing specifically because of AI."', watch: null },
  { speaker: 'Abhas', time: '~2 min', text: '"People come to Claude passionate about an idea — not a business. But before they can run a business, they have to start one, and that means real filings with real government offices: entity formation, a registered agent, Secretary of State registration. Claude can\'t complete those today. It gets someone about 10% of the way and then has to hand them off."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'Secretary of State' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `3` then `2` (headline mention + bullet mention).

- [ ] **Step 4: Open in browser and click through to slide 3**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 3"; slide 3 shows the "systems of action" list and the GEP quote block.

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck Customer Problem slide"
```

---

### Task 4: Slide 4 — Why Anthropic Should Care (Thesis)

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 3 and `NOTES[2]` from Task 3.
- Produces: slide index 3 (fourth slide) and `NOTES[3]`.

- [ ] **Step 1: Insert the slide markup**

Find:

```html
        <div style="margin-top: 12px; padding: 14px 18px; border-radius: 10px; border: 0.5px solid var(--border); background: var(--surface-warm); font-size: 13px; color: var(--text-secondary); line-height: 1.6;">
          If Claude can't finish this step, the founder finishes it somewhere else — and picks the rest of their SMB stack there too.
        </div>
      </div>
    </div>
  </div>

</div>
```

Replace with:

```html
        <div style="margin-top: 12px; padding: 14px 18px; border-radius: 10px; border: 0.5px solid var(--border); background: var(--surface-warm); font-size: 13px; color: var(--text-secondary); line-height: 1.6;">
          If Claude can't finish this step, the founder finishes it somewhere else — and picks the rest of their SMB stack there too.
        </div>
      </div>
    </div>
  </div>

  <!-- 4: Why Anthropic Should Care -->
  <div class="slide">
    <div class="slide-accent"></div>
    <span class="slide-number">03</span>
    <div class="eyebrow">Why Anthropic should care</div>
    <h2 class="display-md">Win them at the start.<br><em>Keep them for the build.</em></h2>
    <p class="body-lg" style="margin-bottom: 20px;">If Claude can help someone start their business — a large, growing, AI-accelerated TAM — they're far more likely to keep using Claude as the ongoing operating system for their entire SMB stack.</p>
    <div class="two-col">
      <div style="padding: 22px; border-radius: 12px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 14px;">The land grab</div>
        <div style="display: flex; flex-direction: column; gap: 9px;">
          <div class="br"><span class="dot6"></span><span>Today's aspiring founders are testing ideas in Lovable, ChatGPT, and Claude before they're SMB owners at all</span></div>
          <div class="br"><span class="dot6"></span><span>Whoever gets them through formation becomes their default operating system going forward</span></div>
          <div class="br"><span class="dot6"></span><span>This is a top-of-funnel move — the first hour of a business, not the fiftieth week</span></div>
        </div>
      </div>
      <div style="padding: 22px; border-radius: 12px; background: #1A1A1A; border: 0.5px solid rgba(255,255,255,0.1);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: #F87B5A; font-weight: 500; margin-bottom: 14px;">The compounding effect</div>
        <div style="display: flex; flex-direction: column; gap: 9px;">
          <div class="br" style="color: rgba(255,255,255,0.72);"><span style="width: 6px; height: 6px; border-radius: 50%; background: #F87B5A; flex-shrink: 0; margin-top: 6px;"></span><span>Formation is the first system of record for a new business — everything after it (banking, payroll, tax) inherits that starting point</span></div>
          <div class="br" style="color: rgba(255,255,255,0.72);"><span style="width: 6px; height: 6px; border-radius: 50%; background: #F87B5A; flex-shrink: 0; margin-top: 6px;"></span><span>Own the start, and Claude is present for every decision that follows</span></div>
        </div>
      </div>
    </div>
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">This is Gusto and Anthropic's chance to capture the next generation of SMB owners <strong style="font-weight: 500;">before they pick their tools somewhere else.</strong></p>
    </div>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find:

```html
  { speaker: 'Abhas', time: '~2 min', text: '"People come to Claude passionate about an idea — not a business. But before they can run a business, they have to start one, and that means real filings with real government offices: entity formation, a registered agent, Secretary of State registration. Claude can\'t complete those today. It gets someone about 10% of the way and then has to hand them off."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Abhas', time: '~2 min', text: '"People come to Claude passionate about an idea — not a business. But before they can run a business, they have to start one, and that means real filings with real government offices: entity formation, a registered agent, Secretary of State registration. Claude can\'t complete those today. It gets someone about 10% of the way and then has to hand them off."', watch: null },
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the thesis: if Claude helps someone start their business, Claude becomes the reason they stick around for everything after. This is a land grab — founders are testing ideas in Lovable, ChatGPT, and Claude before they\'re SMB owners at all. Whoever gets them through formation becomes their default operating system."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'land grab\|Land grab\|The land grab' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `4` then at least `1`.

- [ ] **Step 4: Open in browser and click through to slide 4**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 4"; slide 4 shows "The land grab" and "The compounding effect" cards side by side.

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck thesis slide"
```

---

### Task 5: Slide 5 — The Solution

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 4 and `NOTES[3]` from Task 4.
- Produces: slide index 4 (fifth slide) and `NOTES[4]`. Contains the approved demo placeholder.

- [ ] **Step 1: Insert the slide markup**

Find:

```html
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">This is Gusto and Anthropic's chance to capture the next generation of SMB owners <strong style="font-weight: 500;">before they pick their tools somewhere else.</strong></p>
    </div>
  </div>

</div>
```

Replace with:

```html
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">This is Gusto and Anthropic's chance to capture the next generation of SMB owners <strong style="font-weight: 500;">before they pick their tools somewhere else.</strong></p>
    </div>
  </div>

  <!-- 5: The Solution -->
  <div class="slide">
    <span class="slide-number">04</span>
    <div class="eyebrow">The solution</div>
    <div class="two-col" style="gap: 44px; align-items: center;">
      <div>
        <h2 class="display-md">Gusto fills the<br>missing category.<br><em>Powered under the hood.</em></h2>
        <p class="body" style="margin-bottom: 16px;">Entity formation becomes a native capability inside Claude — powered by Gusto, with no separate app, login, or handoff. The founder never leaves the conversation to become a legal business.</p>
        <p class="body" style="margin-bottom: 16px;">This extends the pattern Anthropic has already set with Claude for Small Business — adding the one category that has to happen before every other SMB workflow can begin.</p>
        <p class="source-note">GTM precedent: anthropic.com/news/claude-for-small-business</p>
      </div>
      <div style="border: 1.5px dashed var(--border-strong); border-radius: 12px; padding: 40px 24px; text-align: center; background: var(--surface-soft);">
        <div style="font-size: 13px; color: var(--text-muted); letter-spacing: 0.04em; margin-bottom: 8px;">[ DEMO ]</div>
        <div style="font-size: 14px; color: var(--text-secondary); line-height: 1.6;">Customer-experience walkthrough of entity formation inside Claude</div>
        <div style="font-size: 12px; color: var(--text-muted); margin-top: 10px; font-style: italic;">To be provided by Izzy / Abhas</div>
      </div>
    </div>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the thesis: if Claude helps someone start their business, Claude becomes the reason they stick around for everything after. This is a land grab — founders are testing ideas in Lovable, ChatGPT, and Claude before they\'re SMB owners at all. Whoever gets them through formation becomes their default operating system."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the thesis: if Claude helps someone start their business, Claude becomes the reason they stick around for everything after. This is a land grab — founders are testing ideas in Lovable, ChatGPT, and Claude before they\'re SMB owners at all. Whoever gets them through formation becomes their default operating system."', watch: null },
  { speaker: 'Abhas', time: '~2 min', text: '"So here\'s the solution: Gusto fills that missing category, powered entirely under the hood — no separate app, no separate login. This extends the exact pattern Anthropic already set with Claude for Small Business."', watch: 'Demo GIF is still pending from the product team — narrate the intended experience verbally if it is not ready by the meeting.' }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c '\[ DEMO \]' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `5` then `1`.

- [ ] **Step 4: Open in browser and click through to slide 5**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 5"; slide 5 shows the dashed-border "[ DEMO ]" placeholder box on the right.

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck Solution slide with demo placeholder"
```

---

### Task 6: Slides 6–8 — What Gusto Will Build (3 options)

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 5 and `NOTES[4]` from Task 5.
- Produces: slide indices 5, 6, 7 (sixth, seventh, eighth slides) and `NOTES[5]`, `NOTES[6]`, `NOTES[7]`. Each slide carries the "INTERNAL — OPTION FOR REVIEW" banner required by Global Constraints.

- [ ] **Step 1: Insert all three slides**

Find:

```html
      <div style="border: 1.5px dashed var(--border-strong); border-radius: 12px; padding: 40px 24px; text-align: center; background: var(--surface-soft);">
        <div style="font-size: 13px; color: var(--text-muted); letter-spacing: 0.04em; margin-bottom: 8px;">[ DEMO ]</div>
        <div style="font-size: 14px; color: var(--text-secondary); line-height: 1.6;">Customer-experience walkthrough of entity formation inside Claude</div>
        <div style="font-size: 12px; color: var(--text-muted); margin-top: 10px; font-style: italic;">To be provided by Izzy / Abhas</div>
      </div>
    </div>
  </div>

</div>
```

Replace with:

```html
      <div style="border: 1.5px dashed var(--border-strong); border-radius: 12px; padding: 40px 24px; text-align: center; background: var(--surface-soft);">
        <div style="font-size: 13px; color: var(--text-muted); letter-spacing: 0.04em; margin-bottom: 8px;">[ DEMO ]</div>
        <div style="font-size: 14px; color: var(--text-secondary); line-height: 1.6;">Customer-experience walkthrough of entity formation inside Claude</div>
        <div style="font-size: 12px; color: var(--text-muted); margin-top: 10px; font-style: italic;">To be provided by Izzy / Abhas</div>
      </div>
    </div>
  </div>

  <!-- 6: What Gusto Will Build — Option 1 -->
  <div class="slide" style="position: relative;">
    <span class="slide-number">05</span>
    <div style="position: absolute; top: 28px; right: 36px; background: #FEF3C7; color: #92400E; font-size: 10px; font-weight: 600; letter-spacing: 0.1em; text-transform: uppercase; padding: 4px 12px; border-radius: 99px; border: 1px solid #F59E0B;">INTERNAL — OPTION FOR REVIEW</div>
    <div class="eyebrow">What Gusto will build — option 1</div>
    <h2 class="display-md">A SYB skill inside<br>the <em>Claude SMB Plugin.</em></h2>
    <div class="two-col">
      <div>
        <p class="body" style="margin-bottom: 12px;">Gusto ships an entity-formation skill that plugs directly into Anthropic's existing Claude SMB Plugin surface — the founder pulls it in the same way they'd pull any other SMB skill.</p>
        <p class="body">Fastest path to distribution: rides Anthropic's existing plugin surface and discovery, with no new connector for the founder to set up.</p>
      </div>
      <div style="padding: 18px 20px; border-radius: 10px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 8px;">Considerations</div>
        <div style="display: flex; flex-direction: column; gap: 7px;">
          <div class="br"><span class="dot6"></span><span>Scoped to what the plugin surface supports today</span></div>
          <div class="br"><span class="dot6"></span><span>Tightest integration with Anthropic's existing SMB plugin roadmap</span></div>
        </div>
      </div>
    </div>
  </div>

  <!-- 7: What Gusto Will Build — Option 2 -->
  <div class="slide" style="position: relative;">
    <span class="slide-number">06</span>
    <div style="position: absolute; top: 28px; right: 36px; background: #FEF3C7; color: #92400E; font-size: 10px; font-weight: 600; letter-spacing: 0.1em; text-transform: uppercase; padding: 4px 12px; border-radius: 99px; border: 1px solid #F59E0B;">INTERNAL — OPTION FOR REVIEW</div>
    <div class="eyebrow">What Gusto will build — option 2</div>
    <h2 class="display-md">A Gusto MCP Connector.<br><em>All SYB skills, one connection.</em></h2>
    <div class="two-col">
      <div>
        <p class="body" style="margin-bottom: 12px;">All SYB capabilities are exposed through the Gusto MCP — the same connector pattern already seeing thousands of activations from Claude users on the accountant and payroll side.</p>
        <p class="body">Founder connects the Gusto MCP once and gets the full formation workflow, plus a natural on-ramp into the rest of Gusto's SMB stack.</p>
      </div>
      <div style="padding: 18px 20px; border-radius: 10px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 8px;">Considerations</div>
        <div style="display: flex; flex-direction: column; gap: 7px;">
          <div class="br"><span class="dot6"></span><span>Reuses infrastructure Gusto has already built and proven</span></div>
          <div class="br"><span class="dot6"></span><span>Requires the founder to explicitly connect the Gusto MCP before their business exists</span></div>
        </div>
      </div>
    </div>
  </div>

  <!-- 8: What Gusto Will Build — Option 3 -->
  <div class="slide" style="position: relative;">
    <span class="slide-number">07</span>
    <div style="position: absolute; top: 28px; right: 36px; background: #FEF3C7; color: #92400E; font-size: 10px; font-weight: 600; letter-spacing: 0.1em; text-transform: uppercase; padding: 4px 12px; border-radius: 99px; border: 1px solid #F59E0B;">INTERNAL — OPTION FOR REVIEW</div>
    <div class="eyebrow">What Gusto will build — option 3</div>
    <h2 class="display-md">Native Claude functionality.<br><em>Gusto-powered underneath.</em></h2>
    <div class="two-col">
      <div>
        <p class="body" style="margin-bottom: 12px;">Entity formation appears as a native Claude capability with no visible plugin or connector step at all — Gusto powers it entirely under the hood.</p>
        <p class="body">Most seamless founder experience: formation feels like a first-party part of Claude, not an add-on.</p>
      </div>
      <div style="padding: 18px 20px; border-radius: 10px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 8px;">Considerations</div>
        <div style="display: flex; flex-direction: column; gap: 7px;">
          <div class="br"><span class="dot6"></span><span>Deepest integration — requires the closest technical coordination with Anthropic</span></div>
          <div class="br"><span class="dot6"></span><span>Gusto's role is least visible to the end founder</span></div>
        </div>
      </div>
    </div>
  </div>

</div>
```

- [ ] **Step 2: Append the three speaker notes**

Find:

```html
  { speaker: 'Abhas', time: '~2 min', text: '"So here\'s the solution: Gusto fills that missing category, powered entirely under the hood — no separate app, no separate login. This extends the exact pattern Anthropic already set with Claude for Small Business."', watch: 'Demo GIF is still pending from the product team — narrate the intended experience verbally if it is not ready by the meeting.' }
];
```

Replace with:

```html
  { speaker: 'Abhas', time: '~2 min', text: '"So here\'s the solution: Gusto fills that missing category, powered entirely under the hood — no separate app, no separate login. This extends the exact pattern Anthropic already set with Claude for Small Business."', watch: 'Demo GIF is still pending from the product team — narrate the intended experience verbally if it is not ready by the meeting.' },
  { speaker: 'Abhas', time: '~1 min', text: '"Option one: a SYB skill inside the Claude SMB Plugin. Fastest to ship — rides Anthropic\'s existing plugin surface."', watch: 'These three build-option slides are an internal Gusto working set — the decision on which to lead with happens inside Gusto before this goes in front of Lina. Do not present this as an open menu for Anthropic to debate live; confirm internally which option(s) survive before the meeting.' },
  { speaker: 'Abhas', time: '~1 min', text: '"Option two: a Gusto MCP Connector exposing all SYB skills — the same pattern already driving thousands of MCP activations on the accountant and payroll side."', watch: null },
  { speaker: 'Abhas', time: '~1 min', text: '"Option three: native Claude functionality, Gusto-powered under the hood — the most seamless experience, and the deepest technical coordination."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'INTERNAL — OPTION FOR REVIEW' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `8` then `3`.

- [ ] **Step 4: Open in browser and click through slides 6–8**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reaches "1 / 8"; each of slides 6, 7, 8 shows the amber "INTERNAL — OPTION FOR REVIEW" banner top-right.

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck build-option slides (internal working set)"
```

---

### Task 7: Slide 9 — The Ask

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 8 and `NOTES[7]` from Task 6.
- Produces: slide index 8 (ninth slide) and `NOTES[8]`.

- [ ] **Step 1: Insert the slide markup**

Find:

```html
          <div class="br"><span class="dot6"></span><span>Deepest integration — requires the closest technical coordination with Anthropic</span></div>
          <div class="br"><span class="dot6"></span><span>Gusto's role is least visible to the end founder</span></div>
        </div>
      </div>
    </div>
  </div>

</div>
```

Replace with:

```html
          <div class="br"><span class="dot6"></span><span>Deepest integration — requires the closest technical coordination with Anthropic</span></div>
          <div class="br"><span class="dot6"></span><span>Gusto's role is least visible to the end founder</span></div>
        </div>
      </div>
    </div>
  </div>

  <!-- 9: The Ask -->
  <div class="slide">
    <div class="slide-accent"></div>
    <span class="slide-number">08</span>
    <div class="eyebrow">The ask</div>
    <h2 class="display-md">One ask.<br>No technical lift <em>for Anthropic.</em></h2>
    <p class="body" style="max-width: 680px; margin-bottom: 20px;">Gusto builds the product. We're asking Anthropic to help us tell people it exists — the same GTM pattern that launched Claude for Small Business.</p>
    <div style="display: flex; flex-direction: column; gap: 12px;">
      <div style="padding: 20px 24px; border-radius: 12px; border: 0.5px solid var(--border); display: flex; gap: 18px; align-items: flex-start;">
        <div style="width: 30px; height: 30px; border-radius: 50%; background: var(--gusto-coral-light); display: flex; align-items: center; justify-content: center; font-size: 13px; color: var(--gusto-coral); font-weight: 600; flex-shrink: 0; margin-top: 1px;">1</div>
        <div><div style="font-size: 15px; font-weight: 500; color: var(--text-primary); margin-bottom: 4px;">Announcement</div><p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">A joint press moment, building on the existing Claude for Small Business launch pattern.</p></div>
      </div>
      <div style="padding: 20px 24px; border-radius: 12px; border: 0.5px solid var(--border); display: flex; gap: 18px; align-items: flex-start;">
        <div style="width: 30px; height: 30px; border-radius: 50%; background: var(--gusto-coral-light); display: flex; align-items: center; justify-content: center; font-size: 13px; color: var(--gusto-coral); font-weight: 600; flex-shrink: 0; margin-top: 1px;">2</div>
        <div><div style="font-size: 15px; font-weight: 500; color: var(--text-primary); margin-bottom: 4px;">Website Inclusion</div><p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">Entity formation called out as a live capability on the Claude for Small Business site.</p></div>
      </div>
      <div style="padding: 20px 24px; border-radius: 12px; border: 0.5px solid var(--border); display: flex; gap: 18px; align-items: flex-start;">
        <div style="width: 30px; height: 30px; border-radius: 50%; background: var(--gusto-coral-light); display: flex; align-items: center; justify-content: center; font-size: 13px; color: var(--gusto-coral); font-weight: 600; flex-shrink: 0; margin-top: 1px;">3</div>
        <div><div style="font-size: 15px; font-weight: 500; color: var(--text-primary); margin-bottom: 4px;">Enablement</div><p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">Inclusion in Anthropic's SMB roadshows and webinars as they happen.</p></div>
      </div>
    </div>
    <p style="margin-top: 10px; font-size: 13px; color: var(--text-muted); font-style: italic; text-align: center;">No capital ask. No engineering ask. Gusto builds it — we need Anthropic to help the world find out.</p>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find:

```html
  { speaker: 'Abhas', time: '~1 min', text: '"Option three: native Claude functionality, Gusto-powered under the hood — the most seamless experience, and the deepest technical coordination."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Abhas', time: '~1 min', text: '"Option three: native Claude functionality, Gusto-powered under the hood — the most seamless experience, and the deepest technical coordination."', watch: null },
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the ask, and it\'s a light one: an announcement building on the Claude for Small Business launch, inclusion on that site, and a spot in your SMB roadshows and webinars. No capital ask, no engineering ask — Gusto builds it."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'No capital ask' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `9` then `1`.

- [ ] **Step 4: Open in browser and click through to slide 9**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 9"; slide 9 shows three numbered ask items (Announcement, Website Inclusion, Enablement).

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck Ask slide"
```

---

### Task 8: Slide 10 — What Anthropic Gets

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 9 and `NOTES[8]` from Task 7.
- Produces: slide index 9 (tenth slide) and `NOTES[9]`.

- [ ] **Step 1: Insert the slide markup**

Find:

```html
    <p style="margin-top: 10px; font-size: 13px; color: var(--text-muted); font-style: italic; text-align: center;">No capital ask. No engineering ask. Gusto builds it — we need Anthropic to help the world find out.</p>
  </div>

</div>
```

Replace with:

```html
    <p style="margin-top: 10px; font-size: 13px; color: var(--text-muted); font-style: italic; text-align: center;">No capital ask. No engineering ask. Gusto builds it — we need Anthropic to help the world find out.</p>
  </div>

  <!-- 10: What Anthropic Gets -->
  <div class="slide">
    <span class="slide-number">09</span>
    <div class="eyebrow">What Anthropic gets</div>
    <h2 class="display-md">What Anthropic<br><em>doesn't have to build.</em></h2>
    <div class="three-col">
      <div style="padding: 22px; border-radius: 12px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 14px;">No action layer to build</div>
        <p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">Gusto owns the formation, registered agent, and state-registration logic end to end.</p>
      </div>
      <div style="padding: 22px; border-radius: 12px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 14px;">No eng work to take on</div>
        <p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">Gusto builds and maintains the capability — no dedicated Anthropic engineering resourcing required.</p>
      </div>
      <div style="padding: 22px; border-radius: 12px; background: var(--surface-soft); border: 0.5px solid var(--border);">
        <div style="font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--gusto-coral); font-weight: 500; margin-bottom: 14px;">No compliance liability</div>
        <p style="font-size: 13px; color: var(--text-secondary); line-height: 1.6;">Entity formation compliance and regulatory exposure stay with Gusto, not Anthropic.</p>
      </div>
    </div>
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">Anthropic gets the land-grab benefit — the next generation of SMB owners choosing Claude first — <strong style="font-weight: 500;">without taking on the build.</strong></p>
    </div>
  </div>

</div>
```

- [ ] **Step 2: Append the speaker note**

Find:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the ask, and it\'s a light one: an announcement building on the Claude for Small Business launch, inclusion on that site, and a spot in your SMB roadshows and webinars. No capital ask, no engineering ask — Gusto builds it."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Izzy', time: '~2 min', text: '"Here\'s the ask, and it\'s a light one: an announcement building on the Claude for Small Business launch, inclusion on that site, and a spot in your SMB roadshows and webinars. No capital ask, no engineering ask — Gusto builds it."', watch: null },
  { speaker: 'Izzy', time: '~1 min', text: '"To be clear about what that means for you: no action layer to build, no eng work to take on, and none of the compliance liability. You get the land-grab benefit without taking on the build."', watch: null }
];
```

- [ ] **Step 3: Verify**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'No compliance liability' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `10` then `1`.

- [ ] **Step 4: Open in browser and click through to slide 10**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 10"; slide 10 shows three cards (no action layer / no eng work / no compliance liability).

- [ ] **Step 5: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck 'What Anthropic Gets' slide"
```

---

### Task 9: Slide 11 — Close, and full-deck verification

**Files:**
- Modify: `decks/gusto-anthropic-entity-formation.html`

**Interfaces:**
- Consumes: slide 10 and `NOTES[9]` from Task 8.
- Produces: slide index 10 (eleventh, final slide) and `NOTES[10]`. This task also runs the Global Constraints checks (no ZenBusiness, no GA date, correct slide count) across the whole file.

- [ ] **Step 1: Insert the closing slide markup**

Find:

```html
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">Anthropic gets the land-grab benefit — the next generation of SMB owners choosing Claude first — <strong style="font-weight: 500;">without taking on the build.</strong></p>
    </div>
  </div>

</div>
```

Replace with:

```html
    <div style="margin-top: 16px; padding: 14px 20px; border-radius: 10px; background: var(--gusto-coral-light); border: 0.5px solid rgba(244,93,59,0.15);">
      <p style="font-size: 14px; color: var(--text-primary); line-height: 1.6;">Anthropic gets the land-grab benefit — the next generation of SMB owners choosing Claude first — <strong style="font-weight: 500;">without taking on the build.</strong></p>
    </div>
  </div>

  <!-- 11: Close -->
  <div class="slide slide-cover">
    <div class="eyebrow">Gusto × Anthropic</div>
    <h2 class="display">The next generation<br>of business owners<br><em>starts here.</em></h2>
    <div class="divider"></div>
    <p class="body-lg">Let's build the front door to the SMB economy, together.</p>
  </div>

</div>
```

- [ ] **Step 2: Append the final speaker note**

Find:

```html
  { speaker: 'Izzy', time: '~1 min', text: '"To be clear about what that means for you: no action layer to build, no eng work to take on, and none of the compliance liability. You get the land-grab benefit without taking on the build."', watch: null }
];
```

Replace with:

```html
  { speaker: 'Izzy', time: '~1 min', text: '"To be clear about what that means for you: no action layer to build, no eng work to take on, and none of the compliance liability. You get the land-grab benefit without taking on the build."', watch: null },
  { speaker: 'Izzy', time: '~1 min', text: '"Let\'s build the front door to the SMB economy, together. What would it take to get alignment on next steps today?"', watch: 'Stop talking after the ask — let Lina respond.' }
];
```

- [ ] **Step 3: Verify final slide count**

```bash
grep -c 'class="slide' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `11`

- [ ] **Step 4: Verify Global Constraints — forbidden content is absent**

```bash
grep -ci 'zenbusiness' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html; echo "exit:$?"
grep -c 'H1 2027\|2027' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html; echo "exit:$?"
```
Expected: both `grep` calls print `0` and `exit:1` (meaning zero matches found — `grep -c` prints the count `0` and exits with status 1 when there are no matches).

- [ ] **Step 5: Verify Global Constraints — required content is present**

```bash
grep -c 'slide-comments-syb-ef:' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
grep -c 'INTERNAL — OPTION FOR REVIEW' /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: `1` (the `getSlideKey` function definition) then `3`.

- [ ] **Step 6: Full click-through in browser**

```bash
open /Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html
```
Expected: counter reads "1 / 11" on load, dots row shows 11 dots, pressing → eleven times lands on the dark "The next generation of business owners starts here" closing slide, pressing S on any slide opens the speaker notes panel with non-empty text for every slide.

- [ ] **Step 7: Commit**

```bash
cd /Users/brandon.reich/maximus && git add decks/gusto-anthropic-entity-formation.html && git commit -m "Add SYB deck closing slide; deck complete at 11 slides"
```

---

### Task 10: Publish to share-some-html

**Files:**
- Read: `decks/gusto-anthropic-entity-formation.html` (no modification)

**Interfaces:**
- Consumes: the completed 11-slide file from Task 9.
- Produces: a `url`, `manage_url`, and `owner_key` for the new page — carried forward to Task 11.

- [ ] **Step 1: Read the final file contents**

Read `/Users/brandon.reich/maximus/decks/gusto-anthropic-entity-formation.html` in full.

- [ ] **Step 2: Call the share tool**

Call `mcp__claude_ai_Share_some_HTML__share` with:
```json
{
  "html_content": "<the full file contents from Step 1>",
  "slug": "gusto-anthropic-entity-formation"
}
```

- [ ] **Step 3: Confirm the response**

Expected: a JSON response containing `url` (e.g. `https://share-some-html.staging.zp-int.com/gusto-anthropic-entity-formation`), `manage_url`, and `owner_key`. Record all three values — they are needed verbatim in Task 11.

- [ ] **Step 4: Open the manage_url**

Open the returned `manage_url` (or `open_url`) in the browser so the page is assigned to the logged-in owner, per the tool's own instructions.

---

### Task 11: Cache the owner key in the auto-memory system

**Files:**
- Create: `/Users/brandon.reich/.claude/projects/-Users-brandon-reich-maximus/memory/reference_share_html_syb.md`
- Modify: `/Users/brandon.reich/.claude/projects/-Users-brandon-reich-maximus/memory/MEMORY.md`

**Interfaces:**
- Consumes: `url` and `owner_key` from Task 10.
- Produces: a memory reference file following the same pattern as the existing `reference_share_html_anthropic.md`, and one new index line in `MEMORY.md`.

- [ ] **Step 1: Write the memory file**

This is outside the `maximus` git repo — write directly, no git commit needed. Use the `url` and `owner_key` values captured in Task 10 (do not use placeholder values — use the exact strings returned by the `share` tool):

```markdown
---
name: share-html-syb-entity-formation
description: Owner key and page metadata for the Gusto × Anthropic Start Your Business (entity formation) pitch deck on share-some-html — needed to push HTML updates
metadata:
  node_type: memory
  type: reference
---

**Page slug:** gusto-anthropic-entity-formation
**URL:** <url returned by the share tool in Task 10>
**Owner key:** <owner_key returned by the share tool in Task 10>

To push an update: use `mcp__claude_ai_Share_some_HTML__update` with `slug: "gusto-anthropic-entity-formation"` and `owner_key: "<owner_key>"`.
```

- [ ] **Step 2: Add the index line to MEMORY.md**

Find the line in `MEMORY.md`:

```
- [Anthropic pitch deck (share-some-html)](reference_share_html_anthropic.md) — slug: gusto-anthropic-accountants-v2, owner_key: Vw2PcuijHAyw5nJ8, public URL: https://share-some-html.staging.zp-int.com/gusto-anthropic-accountants-v2
```

Add a new line immediately after it:

```
- [SYB pitch deck (share-some-html)](reference_share_html_syb.md) — slug: gusto-anthropic-entity-formation, owner key cached in file, entity-formation track of the 3-part Anthropic pitch series
```

- [ ] **Step 3: Verify**

```bash
grep -c 'gusto-anthropic-entity-formation' "/Users/brandon.reich/.claude/projects/-Users-brandon-reich-maximus/memory/reference_share_html_syb.md"
grep -c 'reference_share_html_syb.md' "/Users/brandon.reich/.claude/projects/-Users-brandon-reich-maximus/memory/MEMORY.md"
```
Expected: `1` then `1`.

---

### Task 12: Add Pitch Deck Assets section to the Obsidian SYB note

**Files:**
- Modify: `/Users/brandon.reich/Documents/Gusto-PartnerDevBR/20-Products/Start Your Business (SYB).md`

**Interfaces:**
- Consumes: `url` from Task 10 (owner key is intentionally NOT included here — it stays private-memory-only per the approved spec).

- [ ] **Step 1: Add the section**

Find the end of the file (closing `**` marker after the "Open Threads" section):

```markdown
## Open Threads

- Align with [[Farron-Hicks]] on how [[ZenBusiness]] formation product intersects with [[Start-Your-Business]] roadmap
- Confirm exclusivity scope risk with Allison (legal) before any contract expansion

**
```

Replace with:

```markdown
## Open Threads

- Align with [[Farron-Hicks]] on how [[ZenBusiness]] formation product intersects with [[Start-Your-Business]] roadmap
- Confirm exclusivity scope risk with Allison (legal) before any contract expansion

## Pitch Deck Assets

- **Anthropic pitch (SYB track):** <url returned by the share tool in Task 10>
- Third of three parallel Anthropic pitch tracks (alongside SMB-direct and accountants); presented by [[Izzy-Rogner]]-Hall + Abhas Bodas
- Deck source lives at `decks/gusto-anthropic-entity-formation.html` in the maximus repo

**
```

- [ ] **Step 2: Verify**

```bash
grep -c 'Pitch Deck Assets' "/Users/brandon.reich/Documents/Gusto-PartnerDevBR/20-Products/Start Your Business (SYB).md"
```
Expected: `1`

---

## Self-Review Notes

- **Spec coverage:** All 11 slides from the approved spec map to Tasks 1–9 one-for-one. Publish (Task 10), memory caching (Task 11), and Obsidian update (Task 12) map to the spec's "Publish & asset-tracking plan" section.
- **Placeholder scan:** The only bracketed placeholders in the deck itself are the two approved ones (`[ DEMO ]` demo block, and the absence of a frequency-of-use stat — deliberately not invented). All owner-key/URL placeholders in Tasks 11–12 are explicitly marked "use the exact value from Task 10," not left as TBD.
- **Type/naming consistency:** `getSlideKey` prefix (`slide-comments-syb-ef:`), slug (`gusto-anthropic-entity-formation`), and file path (`decks/gusto-anthropic-entity-formation.html`) are used identically across all 12 tasks.
