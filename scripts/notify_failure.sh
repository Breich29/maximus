#!/bin/bash
# Sends a Slack DM to the user when a workflow fails or misses a run.
# Usage: ./scripts/notify_failure.sh "Daily Brief" "Validation failed at line 42"

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

JOB="${1:-Unknown Job}"
ERROR="${2:-Unknown error}"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"

# SLACK_DM_CHANNEL must be set in config/monnie.env
if [ -z "${SLACK_DM_CHANNEL:-}" ]; then
  echo "notify_failure: SLACK_DM_CHANNEL not set — cannot send alert." >&2
  exit 0
fi

printf 'Send this exact message to Slack channel %s using mcp__slackgustoofficialmcp__slack_send_message. Do not say anything else, just send it.\n\n:rotating_light: *%s %s FAILED* — %s\n\n%s' \
  "${SLACK_DM_CHANNEL}" \
  "${SYSTEM_NAME}" \
  "${JOB}" \
  "${TIMESTAMP}" \
  "${ERROR}" \
| claude -p \
    --allowedTools "mcp__slackgustoofficialmcp__slack_send_message" \
    2>/dev/null

exit 0
