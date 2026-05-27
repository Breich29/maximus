#!/bin/bash
# ${SYSTEM_NAME} — Meeting Prep
# Triggered by launchd every 15 minutes
# Or run manually: ./run_meeting_prep.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

echo "$(date): Starting meeting prep..." >> "${LOG_DIR}/meeting-prep.log"

envsubst < "${SCRIPT_DIR}/prompts/meeting_prep.txt.tmpl" | claude -p \
  --allowedTools "mcp__granolagusto__query_granola_meetings,mcp__granolagusto__get_meeting_transcript,mcp__granolagusto__list_meeting_folders,mcp__gcalgusto__list_events,mcp__gcalgusto__get_event,mcp__gcalgusto__get_free_busy,mcp__gleangusto__search,mcp__gleangusto__meeting_lookup,mcp__slackgustoofficialmcp__slack_read_channel,mcp__slackgustoofficialmcp__slack_search_public_and_private,mcp__slackgustoofficialmcp__slack_search_users,mcp__slackgustoofficialmcp__slack_read_user_profile,Read,Write,Edit,Glob,Bash"

echo "$(date): Meeting prep completed." >> "${LOG_DIR}/meeting-prep.log"
