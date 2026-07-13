#!/bin/bash
# Sends a Slack DM to the user when a workflow fails or misses a run.
# Usage: ./scripts/notify_failure.sh "Daily Brief" "Validation failed at line 42"

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
source "${SCRIPT_DIR}/config/maximus.env"
set +a

JOB="${1:-Unknown Job}"
ERROR="${2:-Unknown error}"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

# SLACK_DM_CHANNEL must be set in config/maximus.env
if [ -z "${SLACK_DM_CHANNEL:-}" ]; then
  echo "notify_failure: SLACK_DM_CHANNEL not set — cannot send alert." >&2
  exit 0
fi

printf 'Send this exact message to Slack channel %s using mcp__claude_ai_Slack_Gusto_Offical__slack_send_message. Do not say anything else, just send it.\n\n:rotating_light: *%s %s FAILED* — %s\n\n%s' \
  "${SLACK_DM_CHANNEL}" \
  "${SYSTEM_NAME}" \
  "${JOB}" \
  "${TIMESTAMP}" \
  "${ERROR}" \
| claude -p \
    --allowedTools "mcp__claude_ai_Slack_Gusto_Offical__slack_send_message" \
    2>/dev/null

exit 0
