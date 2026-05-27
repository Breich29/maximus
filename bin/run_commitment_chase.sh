#!/bin/bash
# ${SYSTEM_NAME} — Commitment Chaser
# Not scheduled by launchd by default (run manually or via custom cron)
# Or run manually: ./run_commitment_chase.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

echo "$(date): Starting commitment chaser..." >> "${LOG_DIR}/commitment-chase.log"

envsubst < "${SCRIPT_DIR}/prompts/commitment_chase.txt.tmpl" | claude -p \
  --allowedTools "mcp__gcalgusto__list_events,mcp__slackgustoofficialmcp__slack_send_message_draft,mcp__slackgustoofficialmcp__slack_search_public_and_private,mcp__slackgustoofficialmcp__slack_read_thread,mcp__slackgustoofficialmcp__slack_read_user_profile,Read,Write,Edit,Glob,Bash"

echo "$(date): Commitment chaser completed." >> "${LOG_DIR}/commitment-chase.log"
