#!/bin/bash
# ${SYSTEM_NAME} — Daily Morning Brief
# Triggered by launchd at ${BRIEF_HOUR}:${BRIEF_MINUTE} local time, Mon-Fri
# Or run manually: ./run_brief.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

# Skip if brief already ran today (prevents duplicate runs from launchd + manual)
TODAY="$(date '+%Y-%m-%d')"
if grep -q "\[${TODAY}\]" "${LOG_DIR}/daily-brief.log" 2>/dev/null; then
  echo "$(date): SKIPPED — brief already ran today." >> "${LOG_DIR}/daily-brief.log"
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
  --allowedTools "mcp__granolagusto__query_granola_meetings,mcp__granolagusto__get_meeting_transcript,mcp__granolagusto__list_meeting_folders,mcp__granolagusto__list_meetings,mcp__granolagusto__get_meetings,mcp__gleangusto__search,mcp__gleangusto__meeting_lookup,mcp__gcalgusto__list_events,mcp__slackgustoofficialmcp__slack_read_channel,mcp__slackgustoofficialmcp__slack_search_public_and_private,mcp__slackgustoofficialmcp__slack_search_users,mcp__slackgustoofficialmcp__slack_read_user_profile,mcp__slackgustoofficialmcp__slack_send_message,Read,Write,Edit,Glob,Bash"

echo "$(date) [${TODAY}]: Daily brief completed." >> "${LOG_DIR}/daily-brief.log"
