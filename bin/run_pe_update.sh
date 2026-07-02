#!/bin/bash
# ${SYSTEM_NAME} — Team Weeklies / PE Update
# Runs at 10pm PT on Fridays and Saturdays (launchd or Claude Code scheduled agent)
# Or run manually: ./bin/run_pe_update.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${LOG_DIR}/pe-update.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "PE Update" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting Team Weeklies / PE update..." >> "${LOG_DIR}/pe-update.log"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/pe-update.log" 2>> "${LOG_DIR}/pe-update.error.log"; then
  echo "$(date): PRE-CHECK FAILED — memory validation failed before PE update." >> "${LOG_DIR}/pe-update.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "PE Update" "Memory validation failed." || true
  exit 1
fi

envsubst < "${SCRIPT_DIR}/prompts/pe_update.txt.tmpl" | claude -p \
  --allowedTools "mcp__granolagusto__query_granola_meetings,mcp__granolagusto__get_meeting_transcript,mcp__granolagusto__list_meeting_folders,mcp__gcalgusto__list_events,mcp__slackgustoofficialmcp__slack_send_message,mcp__slackgustoofficialmcp__slack_search_channels,mcp__notiongusto__notion-fetch,mcp__notiongusto__notion-replace-text,mcp__notiongusto__notion-update-page,Read,Write,Edit,Bash"

echo "$(date): PE update completed." >> "${LOG_DIR}/pe-update.log"
