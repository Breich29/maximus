#!/bin/bash
# ${SYSTEM_NAME} — Channel Sync (Memory + Obsidian)
# Reads #maximus-updates (the cloud brief/review routines' only output surface) since the
# last synced marker in memory/extraction_tracker.md, and files decisions, commitments,
# partner/project status changes, and people facts into the canonical memory/*.md stores
# and mirrors a summary into the Obsidian vault.
#
# Does NOT touch memory/action_items.md — that file is the exclusive responsibility of the
# cloud "Maximus — Channel Scanner (Action Items)" routine, which commits + pushes it to
# origin/main up to 3x/day. Writing to it here would race that routine.
#
# Triggered by launchd Mon-Fri ~10:00pm local time, or run manually: ./run_channel_sync.sh
# Runs late in the day so it picks up everything the cloud routines posted that day
# (morning brief 7:30am, competitive pulse Mon 8am, channel scanner 8am/12pm/4pm,
# night-before 9pm Mon-Thu, Friday review 2pm + weekly draft 3pm).

set -euo pipefail

# launchd runs with a minimal PATH that omits Homebrew — needed for claude, envsubst, etc.
export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
 source "${SCRIPT_DIR}/config/maximus.env"
 set +a

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${LOG_DIR}/channel-sync.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Channel Sync" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting channel sync..." >> "${LOG_DIR}/channel-sync.log"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/channel-sync.log" 2>> "${LOG_DIR}/channel-sync.error.log"; then
  echo "$(date): PRE-CHECK FAILED — memory validation failed before channel sync." >> "${LOG_DIR}/channel-sync.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Channel Sync" "Memory validation failed before channel sync." || true
  exit 1
fi

CLAUDE_OUTPUT="$(envsubst < "${SCRIPT_DIR}/prompts/channel_sync.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,mcp__claude_ai_Slack_Gusto_Offical__slack_read_thread,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,Read,Write,Edit,Glob,Bash")"
echo "${CLAUDE_OUTPUT}"

# The prompt exits 0 even when it correctly declines to sync (e.g. Slack MCP unavailable this
# session) — that's a real gap Brandon should hear about, not a silent no-op, so treat the
# prompt's own "FAIL-CLOSED: ..." sentinel line as a failure here even though claude's own exit
# code was clean.
if echo "${CLAUDE_OUTPUT}" | grep -q "^FAIL-CLOSED:"; then
  REASON="$(echo "${CLAUDE_OUTPUT}" | grep "^FAIL-CLOSED:" | tail -1)"
  echo "$(date): FAILED (fail-closed, no bash-level error) — ${REASON}" >> "${LOG_DIR}/channel-sync.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Channel Sync" "${REASON}" || true
  exit 1
fi

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/channel-sync.log" 2>> "${LOG_DIR}/channel-sync.error.log"; then
  echo "$(date): POST-CHECK FAILED — memory validation failed after channel sync." >> "${LOG_DIR}/channel-sync.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Channel Sync" "Post-sync validation failed." || true
  exit 1
fi

echo "$(date): Channel sync completed." >> "${LOG_DIR}/channel-sync.log"
