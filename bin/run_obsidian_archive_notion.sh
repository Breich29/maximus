#!/bin/bash
# Maximus — Obsidian Archive (Team Weeklies Notion)
# Mirrors Brandon's finalized section of the Team Weeklies Notion page — written by the cloud
# "Weekly update draft" routine once Brandon approves (Fri or Sat night) — into the Obsidian
# vault. Read-only against Notion; never writes back to Notion or Slack.
#
# Triggered by launchd Sun ~8:00am PT, safely after the Fri/Sat 10pm approval window closes.

set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
 source "${SCRIPT_DIR}/config/maximus.env"
 set +a

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"
LOG_FILE="${LOG_DIR}/obsidian-archive-notion-weekly.log"
ERR_FILE="${LOG_DIR}/obsidian-archive-notion-weekly.error.log"

unset CLAUDECODE

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${ERR_FILE}"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Obsidian Archive (Notion Weekly)" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting obsidian archive (notion-weekly)..." >> "${LOG_FILE}"

envsubst < "${SCRIPT_DIR}/prompts/obsidian_archive_notion_weekly.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Notion_Gusto__notion-fetch,mcp__claude_ai_Notion_Gusto__notion-search,Read,Write,Bash"

echo "$(date): Obsidian archive (notion-weekly) completed." >> "${LOG_FILE}"
