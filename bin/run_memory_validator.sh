#!/bin/bash
# ${SYSTEM_NAME} — Memory Validator
# Manual or scheduled consistency checks for memory/*.md.
# Or run manually: ./run_memory_validator.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${SCRIPT_DIR}/config/monnie.env"

LOG_DIR="${SCRIPT_DIR}/logs"
mkdir -p "${LOG_DIR}"

echo "$(date): Running memory validator..." >> "${LOG_DIR}/memory-validator.log"
"${SCRIPT_DIR}/scripts/validate_memory.sh"
echo "$(date): Memory validator completed." >> "${LOG_DIR}/memory-validator.log"
