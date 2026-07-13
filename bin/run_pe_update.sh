#!/bin/bash
# ${SYSTEM_NAME} — Team Weeklies / PE Update
# Runs at 10pm PT on Fridays and Saturdays (launchd or Claude Code scheduled agent)
# Or run manually: ./bin/run_pe_update.sh

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
  --allowedTools "mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,mcp__claude_ai_Granola_Gusto__list_meeting_folders,mcp__claude_ai_Gcal_Gusto__list_events,mcp__claude_ai_Slack_Gusto_Offical__slack_send_message,mcp__claude_ai_Slack_Gusto_Offical__slack_search_channels,mcp__claude_ai_Notion_Gusto__notion-fetch,mcp__claude_ai_Notion_Gusto__notion-update-page,Read,Write,Edit,Bash"
# Note: Notion MCP (mcp__claude_ai_Notion_Gusto__*) is only available in claude.ai sessions.
# For automated Notion writes, use the CronCreate living routine in Claude Code Desktop.

echo "$(date): PE update completed." >> "${LOG_DIR}/pe-update.log"
