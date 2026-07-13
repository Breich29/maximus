#!/bin/bash
# ${SYSTEM_NAME} — Daily Morning Brief
# Triggered by launchd at ${BRIEF_HOUR}:${BRIEF_MINUTE} local time, Mon-Fri
# Or run manually: ./run_brief.sh

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

# Skip if brief already ran for this slot today (prevents duplicate runs from
# launchd + manual, while still allowing the separate morning and night-before slots)
TODAY="$(date '+%Y-%m-%d')"
SLOT="AM"
if [ "$(date '+%H')" -ge 12 ]; then SLOT="PM"; fi
STAMP="${TODAY}-${SLOT}"
if grep -q "\[${STAMP}\]" "${LOG_DIR}/daily-brief.log" 2>/dev/null; then
  echo "$(date): SKIPPED — brief already ran for ${STAMP}." >> "${LOG_DIR}/daily-brief.log"
  exit 0
fi

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${LOG_DIR}/daily-brief.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Daily Brief" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting daily brief..." >> "${LOG_DIR}/daily-brief.log"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/daily-brief.log" 2>> "${LOG_DIR}/daily-brief.error.log"; then
  echo "$(date): PRE-CHECK FAILED — memory validation failed before daily brief." >> "${LOG_DIR}/daily-brief.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Daily Brief" "Memory validation failed before brief." || true
  exit 1
fi

envsubst < "${SCRIPT_DIR}/prompts/daily_brief.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,mcp__claude_ai_Granola_Gusto__list_meeting_folders,mcp__claude_ai_Granola_Gusto__list_meetings,mcp__claude_ai_Granola_Gusto__get_meetings,mcp__claude_ai_Glean__search,mcp__claude_ai_Glean__meeting_lookup,mcp__claude_ai_Gcal_Gusto__list_events,mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,mcp__claude_ai_Slack_Gusto_Offical__slack_search_users,mcp__claude_ai_Slack_Gusto_Offical__slack_read_user_profile,mcp__claude_ai_Slack_Gusto_Offical__slack_send_message,Read,Write,Edit,Glob,Bash"

echo "$(date) [${STAMP}]: Daily brief completed." >> "${LOG_DIR}/daily-brief.log"
