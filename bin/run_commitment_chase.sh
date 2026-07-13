#!/bin/bash
# ${SYSTEM_NAME} — Commitment Chaser
# Not scheduled by launchd by default (run manually or via custom cron)
# Or run manually: ./run_commitment_chase.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
 source "${SCRIPT_DIR}/config/maximus.env"
 set +a

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

echo "$(date): Starting commitment chaser..." >> "${LOG_DIR}/commitment-chase.log"

envsubst < "${SCRIPT_DIR}/prompts/commitment_chase.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Gcal_Gusto__list_events,mcp__claude_ai_Slack_Gusto_Offical__slack_send_message_draft,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,mcp__claude_ai_Slack_Gusto_Offical__slack_read_thread,mcp__claude_ai_Slack_Gusto_Offical__slack_read_user_profile,Read,Write,Edit,Glob,Bash"

echo "$(date): Commitment chaser completed." >> "${LOG_DIR}/commitment-chase.log"
