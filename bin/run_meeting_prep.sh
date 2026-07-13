#!/bin/bash
# ${SYSTEM_NAME} — Meeting Prep
# Triggered by launchd every 15 minutes
# Or run manually: ./run_meeting_prep.sh

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

echo "$(date): Starting meeting prep..." >> "${LOG_DIR}/meeting-prep.log"

envsubst < "${SCRIPT_DIR}/prompts/meeting_prep.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,mcp__claude_ai_Granola_Gusto__list_meeting_folders,mcp__claude_ai_Gcal_Gusto__list_events,mcp__claude_ai_Gcal_Gusto__get_event,mcp__claude_ai_Gcal_Gusto__get_free_busy,mcp__claude_ai_Glean__search,mcp__claude_ai_Glean__meeting_lookup,mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,mcp__claude_ai_Slack_Gusto_Offical__slack_search_users,mcp__claude_ai_Slack_Gusto_Offical__slack_read_user_profile,Read,Write,Edit,Glob,Bash"

echo "$(date): Meeting prep completed." >> "${LOG_DIR}/meeting-prep.log"
