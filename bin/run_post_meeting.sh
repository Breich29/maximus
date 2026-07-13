#!/bin/bash
# ${SYSTEM_NAME} — Post-Meeting Extraction
# Not scheduled by launchd by default (run manually or via custom cron)
# Or run manually: ./run_post_meeting.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
 source "${SCRIPT_DIR}/config/maximus.env"
 set +a

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

echo "$(date): Starting post-meeting extraction..." >> "${LOG_DIR}/post-meeting.log"

envsubst < "${SCRIPT_DIR}/prompts/post_meeting.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,mcp__claude_ai_Granola_Gusto__list_meeting_folders,mcp__claude_ai_Granola_Gusto__list_meetings,mcp__claude_ai_Granola_Gusto__get_meetings,mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,Read,Write,Edit,Glob,Bash"

echo "$(date): Post-meeting extraction completed." >> "${LOG_DIR}/post-meeting.log"
