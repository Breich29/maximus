#!/bin/bash
# ${SYSTEM_NAME} — Post-Meeting Extraction
# Not scheduled by launchd by default (run manually or via custom cron)
# Or run manually: ./run_post_meeting.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

echo "$(date): Starting post-meeting extraction..." >> "${LOG_DIR}/post-meeting.log"

envsubst < "${SCRIPT_DIR}/prompts/post_meeting.txt.tmpl" | claude -p \
  --allowedTools "mcp__granolagusto__query_granola_meetings,mcp__granolagusto__get_meeting_transcript,mcp__granolagusto__list_meeting_folders,mcp__granolagusto__list_meetings,mcp__granolagusto__get_meetings,mcp__slackgustoofficialmcp__slack_read_channel,mcp__slackgustoofficialmcp__slack_search_public_and_private,Read,Write,Edit,Glob,Bash"

echo "$(date): Post-meeting extraction completed." >> "${LOG_DIR}/post-meeting.log"
