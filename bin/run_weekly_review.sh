#!/bin/bash
# ${SYSTEM_NAME} — Weekly Review
# Triggered by launchd at ${WEEKLY_REVIEW_HOUR}:${WEEKLY_REVIEW_MINUTE} every Friday
# Or run manually: ./run_weekly_review.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${LOG_DIR}/weekly-review.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Weekly Review" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting weekly review..." >> "${LOG_DIR}/weekly-review.log"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/weekly-review.log" 2>> "${LOG_DIR}/weekly-review.error.log"; then
  echo "$(date): PRE-CHECK FAILED — memory validation failed before weekly review." >> "${LOG_DIR}/weekly-review.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Weekly Review" "Memory validation failed before review." || true
  exit 1
fi

envsubst < "${SCRIPT_DIR}/prompts/weekly_review.txt.tmpl" | claude -p \
  --allowedTools "mcp__granolagusto__query_granola_meetings,mcp__granolagusto__get_meeting_transcript,mcp__granolagusto__list_meeting_folders,mcp__gleangusto__search,mcp__gleangusto__meeting_lookup,mcp__gcalgusto__list_events,mcp__slackgustoofficialmcp__slack_send_message,mcp__slackgustoofficialmcp__slack_read_channel,mcp__slackgustoofficialmcp__slack_search_public_and_private,mcp__slackgustoofficialmcp__slack_search_users,Read,Write,Edit,Glob,Bash"

echo "$(date): Weekly review completed." >> "${LOG_DIR}/weekly-review.log"
