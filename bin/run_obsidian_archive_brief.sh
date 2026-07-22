#!/bin/bash
# Maximus — Obsidian Archive (Briefs / Weekly Review)
# Mirrors the verbatim content of a cloud-generated brief/review — already posted to
# #maximus-updates by the read-only cloud CCR routines — into the Obsidian vault. Does NOT
# regenerate the brief; the cloud routines remain the sole source of truth for content. Uses
# the same read-only-against-Slack pattern as run_channel_sync.sh, just narrower and archival.
#
# Usage: ./run_obsidian_archive_brief.sh <daily-brief|night-before|weekly-review>
# Triggered by launchd shortly after each cloud routine's known post time:
#   daily-brief    — Mon-Fri ~7:45am PT (cloud brief posts 7:30am PT)
#   night-before   — Mon-Thu ~9:15pm PT (cloud prep posts ~9pm PT)
#   weekly-review  — Fri ~2:15pm PT (cloud review posts 2pm PT)

set -euo pipefail

# launchd runs with a minimal PATH that omits Homebrew — needed for claude, envsubst, etc.
export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a
 source "${SCRIPT_DIR}/config/maximus.env"
 set +a

ARTIFACT="${1:-}"
case "${ARTIFACT}" in
  daily-brief)
    export ARCHIVE_LABEL="Daily AM Brief"
    export ARCHIVE_MATCH_TEXT="Daily AM Brief"
    export ARCHIVE_OUTPUT_DIR="90-Maximus/briefs"
    export ARCHIVE_OUTPUT_SLUG="daily-brief"
    export ARCHIVE_LOOKBACK_HOURS=3
    ;;
  night-before)
    export ARCHIVE_LABEL="Night-Before Prep"
    export ARCHIVE_MATCH_TEXT="Night-Before Prep"
    export ARCHIVE_OUTPUT_DIR="90-Maximus/briefs"
    export ARCHIVE_OUTPUT_SLUG="night-before-prep"
    export ARCHIVE_LOOKBACK_HOURS=3
    ;;
  weekly-review)
    export ARCHIVE_LABEL="Friday Weekly Review"
    export ARCHIVE_MATCH_TEXT="Weekly Review"
    export ARCHIVE_OUTPUT_DIR="90-Maximus/weekly-review"
    export ARCHIVE_OUTPUT_SLUG="weekly-review"
    export ARCHIVE_LOOKBACK_HOURS=3
    ;;
  *)
    echo "Usage: $0 <daily-brief|night-before|weekly-review>" >&2
    exit 1
    ;;
esac

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"
LOG_FILE="${LOG_DIR}/obsidian-archive-${ARTIFACT}.log"
ERR_FILE="${LOG_DIR}/obsidian-archive-${ARTIFACT}.error.log"

# Required when launched from launchd or from inside another Claude session
unset CLAUDECODE

on_error() {
  local msg="Failed at: ${BASH_COMMAND} (exit $?)"
  echo "$(date): FAILED — ${msg}" >> "${ERR_FILE}"
  "${SCRIPT_DIR}/scripts/notify_failure.sh" "Obsidian Archive (${ARTIFACT})" "${msg}" || true
  exit 1
}
trap 'on_error' ERR

echo "$(date): Starting obsidian archive (${ARTIFACT})..." >> "${LOG_FILE}"

envsubst < "${SCRIPT_DIR}/prompts/obsidian_archive_brief.txt.tmpl" | claude -p \
  --allowedTools "mcp__claude_ai_Slack_Gusto_Offical__slack_read_channel,Read,Write,Bash"

echo "$(date): Obsidian archive (${ARTIFACT}) completed." >> "${LOG_FILE}"
