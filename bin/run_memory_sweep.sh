#!/bin/bash
# ${SYSTEM_NAME} — Weekly Memory Sweep
# Deep scan of Slack DMs, Calendar, and Glean to refresh people.md, projects.md, commitments.md.
# Also runs a #maximus-updates channel-sync integrity check (see prompts/memory_sweep.txt.tmpl
# Phase 2B) as a weekly backstop for bin/run_channel_sync.sh, the daily job that does the
# primary channel sync.
# Triggered by launchd Friday 6pm local time, or run manually: ./run_memory_sweep.sh
# Run end-of-week so context from the workday is still fresh.

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
  echo "$(date): FAILED — ${msg}" >> "${LOG_DIR}/memory-sweep.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Memory Sweep" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting memory sweep..." >> "${LOG_DIR}/memory-sweep.log"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/memory-sweep.log" 2>> "${LOG_DIR}/memory-sweep.error.log"; then
  echo "$(date): PRE-CHECK FAILED — memory validation failed before sweep." >> "${LOG_DIR}/memory-sweep.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Memory Sweep" "Memory validation failed before sweep." || true
  exit 1
fi

envsubst < "${SCRIPT_DIR}/prompts/memory_sweep.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Gcal_Gusto__list_events,mcp__claude_ai_Glean__search,mcp__claude_ai_Glean__meeting_lookup,mcp__claude_ai_Glean__employee_search,mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,mcp__claude_ai_Slack_Gusto_Offical__slack_read_thread,mcp__claude_ai_Slack_Gusto_Offical__slack_search_public_and_private,mcp__claude_ai_Slack_Gusto_Offical__slack_search_users,mcp__claude_ai_Slack_Gusto_Offical__slack_read_user_profile,mcp__claude_ai_Granola_Gusto__query_granola_meetings,mcp__claude_ai_Granola_Gusto__get_meeting_transcript,Read,Write,Edit,Glob,Bash"

if ! "${SCRIPT_DIR}/scripts/validate_memory.sh" >> "${LOG_DIR}/memory-sweep.log" 2>> "${LOG_DIR}/memory-sweep.error.log"; then
  echo "$(date): POST-CHECK FAILED — memory validation failed after sweep." >> "${LOG_DIR}/memory-sweep.error.log"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Memory Sweep" "Post-sweep validation failed." || true
  exit 1
fi

echo "$(date): Memory sweep completed." >> "${LOG_DIR}/memory-sweep.log"
